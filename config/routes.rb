Rails.application.routes.draw do
   devise_for :users
   get 'questions/index'
   root to:'quizzes#index'
   post '/question/choices',to:'questions#choices'
   get '/user/account', to:'pages#user',as:'user'
   get "/tools/create" => redirect("/quizzes/new")
   get '/metronome',to:'pages#metronome',as:'metronome'
   get '/tools',to:'pages#tools',as:'mainTools'
   get '/questions/choices',to:'questions#choices',as: 'choice_question'
   get '/tools/modify',to:'pages#modify',as:'modify_quiz'
   get '/tools/delete',to:'pages#delete',as:'delete_quiz'
   get '/tools/modify',to:'pages#modify',as:'modify_question'
   get '/tools/delete',to:'pages#delete',as:'delete_question'
   get '/help',to:'pages#help',as:'help'
   get '/quizzes/:id/results',to:'quizzes#results',as:'results_quiz'
   resources :questions
   resources :quizzes
   patch '/quizzes/:id/check',to:'quizzes#check',as:'check_quiz'





end
