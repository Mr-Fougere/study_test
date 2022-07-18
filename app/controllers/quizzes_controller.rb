class QuizzesController < ApplicationController
  def index
    @quizz=Quiz.all
    @user=User.new
    if current_user 
      if current_user[:currentQuestion] !=nil
      session[:currentQuestion]=current_user[:currentQuestion]
      session[:currentQuiz]=current_user[:currentQuiz]
      session[:goodAnswer]=current_user[:goodAnswer]
    end
    puts current_user.inspect
    end
      @current_methode="index"
    end

  def edit
    @quiz=Quiz.find(params[:id])
    @questions=Question.all
    
  end

  def show
    @user=User.new
    @quiz=Quiz.find(params[:id])

    if params[:question].to_i>5
    redirect_to results_quiz_path(id:params[:id]) and return
    end
    if session[:currentQuestion] and session[:currentQuiz]==params[:id]
      @questionUser=session[:currentQuestion]
    else
        if session[:currentQuiz]!=params[:id]
          @questionUser=params[:question]
        else
          @questionUser=1
        end
    end
    
    puts session[:currentQuestion].to_s!=params[:question].to_s 
    if (session[:currentQuestion].to_s!=params[:question].to_s or params[:user_answer] )and session[:currentQuiz].to_s==params[:id].to_s
      @question=Question.find(@quiz.send("question#{params[:question]}_id"))
      @goodAnswer=Question.find(@question.id)["goodAnswer"]
      @userAnswer=params[:user_answer].to_s
      @numQuestion=params[:question]
    else
      @question=Question.find(@quiz.send("question#{@questionUser}_id"))
      @goodAnswer=nil
      @userAnswer=nil
      @numQuestion=@questionUser
    end

    if @question['theme']=="sprite"
      @sprite=true
    else
      @sprite=false
    end
  end

  def check
    @user=User.new
    puts "-------"
    puts params.inspect
    puts current_user.inspect
    puts session[:currentQuiz]
    puts session.inspect
    puts "-------"

    if params[:question]=="1" and session[:currentQuiz]!=params[:id]
      @status = true
    else
      @status = params[:question].to_s==session[:currentQuestion].to_s  
    end 
    if @status 
      if session[:currentQuestion] and session[:currentQuiz] and session[:goodAnswer] and session[:currentQuiz].to_s==params[:id].to_s
        session[:currentQuestion]=session[:currentQuestion].to_i+1
      else
        session[:currentQuestion]=2
        session[:currentQuiz]=params[:id]
        session[:goodAnswer]=0
      end 
      if Question.find(Quiz.find(params[:id]).send("question#{params[:question]}_id"))["goodAnswer"]==params[:user_answer].to_i
          session[:goodAnswer]=session[:goodAnswer].to_i+1
      end
      
      if current_user
        user=current_user
      else
        user=User.find(1)
      end
      if session[:currentQuestion]<=5
        user[:goodAnswer]=session[:goodAnswer]
        user[:currentQuestion]=session[:currentQuestion]
        user[:currentQuiz]=session[:currentQuiz]
      else 
        user[:goodAnswer]=nil
        user[:currentQuestion]=nil
        user[:currentQuiz]=nil
      end
      params[:user]=ActionController::Parameters.new({user:user})
      user_params=params.require(:user).permit(:id,:username,:goodAnswer,:currentQuestion,:currentQuiz)
      user.update(user_params)
      redirect_to quiz_path(id:params[:id],question:params[:question],user_answer:params[:user_answer])
    else
      redirect_to quiz_path(id:params[:id],question:session[:currentQuestion],user_answer:params[:user_answer])
    end 
    end

  def results
      @quiz=Quiz.find(params[:id])
      @good=session[:goodAnswer] 
        resetSession()
  end

  def new

    @questions=Question.all
    @quiz = Quiz.new

  end

  def resetSession
    session.delete("currentQuestion")
    session.delete("goodAnswer")
    session.delete("currentQuiz")
  end

  def destroy

    @quiz = Quiz.find(params[:id])

    @quiz.destroy

    session[:delete] = "Quiz n°"+@quiz.id.to_s+" supprimé avec succés"
    redirect_to quizzes_path

  end

  def create
    quiz_params=params.require(:quiz).permit(:question1_id,:question2_id,:question3_id,:question4_id,:question5_id,:difficulty)
    quiz = Quiz.create(quiz_params)
    session[:create] = "Quiz créé avec succés"
    redirect_to quizzes_path
  end

  def update
    @quiz=Quiz.find(params[:id])
    quiz_params=params.require(:quiz).permit(:question1_id,:question2_id,:question3_id,:question4_id,:question5_id,:difficulty)
    @quiz.update(quiz_params)
    session[:update] = "Quiz n°"+@quiz.id.to_s+" mis à jour avec succés"
    puts quiz_params
    puts quiz_params.inspect
    puts quiz_params.inspect

    redirect_to quizzes_path
  end
end
