class QuizzesController < ApplicationController
  def index
    @quizz=Quiz.all
  end

  def edit
    @quiz=Quiz.find(params[:id])
    @questions=Question.all
    
  end

  def start
    puts "le quizz commence"
      @quiz=Quiz.find(params[:id])
      session[:currentQuiz]=params[:id]
      session[:currentQuestion]=0
      session[:goodAnswer]=0
      session[:status]=0
      session[:userAnswer]=0
      session[:questions]=[Question.find(@quiz.question1_id),Question.find(@quiz.question2_id),Question.find(@quiz.question3_id),Question.find(@quiz.question4_id),Question.find(@quiz.question5_id)]
      redirect_to quiz_path(params[:id])  
  end

  def show
    @quiz=Quiz.find(params[:id])
    @question=session[:questions][session[:currentQuestion].to_i]
    if @question["themes"]=="sprite"
      @sprite=true
    else
      @sprite=false
    end
    if session[:status]==1
      puts "status a 1 dans show"

      @goodAnswer=session[:questions][session[:currentQuestion]]["goodAnswer"].to_s
      @userAnswer=session[:userAnswer].to_s
    else
      @goodAnswer=nil
      @userAnswer=nil
    end

  end

  def check
    if session[:status]==0 and session[:questions][session[:currentQuestion]]["goodAnswer"]==params[:user_answer].to_i
      session[:goodAnswer]=session[:goodAnswer].to_i+1
    end
    if session[:status]==0
      session[:status]=1
      session[:userAnswer]=params[:user_answer]
      redirect_to quiz_path(params[:id]) and return
    else
      session[:status]=0
      if session[:currentQuestion]<4
        redirect_to quiz_path(params[:id])
        session[:currentQuestion]=session[:currentQuestion].to_i+1
      else
        session.delete(:currentQuestion)
        session.delete(:currentQuiz)
        session.delete(:questions)
        redirect_to results_quiz_path(params[:id])
      end
    end 
  end
  def results
    @quiz=Quiz.find(params[:id])
  end

  def new

    @questions=Question.all
    @quiz = Quiz.new

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

    redirect_to quizzes_path
  end
end
