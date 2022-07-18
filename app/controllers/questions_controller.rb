class QuestionsController < ApplicationController
  def index
        @current_page="List of questions availables"
    @questions= Question.all
  end

  def show
  end

  def create

    question= ActionController::Parameters.new
    arrayAnswers=JSON.parse(params[:answers])
    arrayAnswers.push(params[:goodAnswer])
    arrayAnswers.shuffle
    for i in 1..4 do
      question[:"answer#{i}"]=arrayAnswers[i-1]
      if arrayAnswers[i-1]=params[:goodAnswer]
        question[:goodAnswer]=i
      end
    end
    question[:question]=params[:quest]
    question[:theme]=params[:theme].to_s
    question[:category]=params[:category].to_s
    params[:questions]=question
    q_params=params.require(:questions).permit(:answer1,:answer2,:answer3,:answer4,:goodAnswer,:question,:category,:type,:theme)
    question = Question.create(q_params)

    redirect_to root_path
  end
  def new
    if params[:page]
      if params[:choice]=="good"
        session[:currentPageGood]=params[:page]
      elsif params[:choice]=="bad"
        session[:currentPageBad]=params[:page]
      end
    end 

    if params[:subType]
      session[:currentSubType]=params[:subType]
      session[:currentPageGood]=1
      session[:currentPageBad]=1
    end

    if params[:method]
      session[:currentMethod]=params[:method]
    end
    
    @spriteON=false
 
    @rawGoodData=getAPI(session[:currentType],[],25,session[:currentPageGood].to_i)
    @rawBadData=getAPI(session[:currentType],[],25,session[:currentPageBad].to_i)

    @rawSubData=getAPI(session[:currentTheme],[session[:currentType]],1,session[:currentSubType].to_i+1)
    @dataQuestion=@rawSubData[:array]

    @question=Question.new
    @spriteON=false
    if ["name","pokedex","sprite"].include?(session[:currentType])
    @spriteON=true
    end
    @countBadPages=@rawBadData[:count]
    @countGoodPages=@rawGoodData[:count]
    @dataGood=@rawGoodData[:array]
    @dataBad=@rawBadData[:array]

    @pageGood=session[:currentPageGood].to_i
    @pageBad=session[:currentPageBad].to_i
    case session[:currentType]
    when "generation" 
      @dataGood=[[@dataQuestion[0][1],@dataQuestion[0][2]]]
      @availableMethods=["correct"]
      session[:currentMethod]="correct"
      @dataBad.delete(@dataGood[0])
    when "sprite"
      @dataGood=[[@dataQuestion[0][0],@dataQuestion[0][1]]]
      puts @dataGood.inspect
      @availableMethods=["correct"]
      session[:currentMethod]="correct"
      @dataBad.delete(@dataGood[0])
    end

  end

  def choices
    if params[:start] || params[:theme]
      session[:currentPage]=1
      session[:currentTheme]=params[:theme]
    end

    if params[:type]
      session[:currentType]=params[:type]
      session[:currentTheme]=params[:theme]
    end

    if params[:page]
      session[:currentPage]=params[:page]
      end 

    @numPage=session[:currentPage].to_i
    curThm=session[:currentTheme]
    @exPkmn=PokeApi.get(pokemon:1)
    @exItem=PokeApi.get(item:1)
    @queryResults=[]
    @spriteON=false

    if curThm=="move"
      @queryMove=PokeApi.get(move:{limit: 24,page:@numPage})
      for i in 0...24 do 
        @queryResults.append([@queryMove.results[i].get.name,@queryMove.results[i].type.name] )
      end
      @numberPages=@queryMove.count/24
    end
    
    if curThm=="type"
      @queryType=PokeApi.get(:type) 
      for i in 0...@queryType.count do 
        @queryResults.append(@queryType.results[i].get.name)
      end
    end

    if curThm=="generation"
      @queryGen=PokeApi.get(:generation)
      for i in 0...@queryGen.count do 
        @queryResults.append([@queryGen.results[i].get.name,@queryGen.results[i].main_region.name])
      end
    end

    if curThm=="sprite" or curThm=="name" or curThm=="pokedex"
      @spriteON=true
      @queryPkmn=PokeApi.get(pokemon:{limit: 24,page:@numPage})
      for i in 0...24 do 
        if curThm =="pokedex"
          @queryResults.append([@queryPkmn.results[i].get.sprites.front_default,@queryPkmn.results[i].species.get.pokedex_numbers[0].entry_number ])
        else 
          @queryResults.append([@queryPkmn.results[i].get.sprites.front_default,@queryPkmn.results[i].name])
        end
      end
      @numberPages=@queryPkmn.count/24
    end
  end

  def getAPI(category,infos,count,page)
    #avaialble category name/sprite/type/move/generation/pokedex
    data={:count=>0,:array=>[]}
    limits={limit:count,page:page}
    cat=category
    search=infos
    array=[]
    puts search.inspect
    case cat
      when "name","sprite","pokedex"
        cat="pokemon"
        search=['id','name'] if search.empty?
      when "type"
        search=['name'] if infos.empty?
      when 'move'
        search=['name',["type","name"]] if search.empty?
      when 'generation'
        search=['name',["main_region","name"]] if search.empty?
      end   
    case search[0]
      when "generation"
        search=['name',["game_indices","first","version","get","version_group","get","generation","name"],["game_indices","first","version","get","version_group","get","generation","get","main_region","name"]]  
      when "sprite"
        search=['id','name']  
      end
    for i in count*(page-1)...count*(page) do
        tP=[]
        search.each do |s|
          begin
            tS=PokeApi.get("#{cat}": i)
            if !s.kind_of?(Array)
              tP.push(tS.send(s))
            else
              s.each do |ss|
                tS=tS.send(ss)
              end
              tP.push(tS)
            end
          rescue
            puts "breaks"
          break
          end
        end
        if !tP.empty?
          array.push(tP)
        end
    end
    data[:array]=array
    data[:count]=PokeApi.get(:"#{cat}").count/count
    puts data.inspect
    return data
    
  end
end
