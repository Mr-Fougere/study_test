class PagesController < ApplicationController

    def metronome

    end

    def help
    
    end

    def user 
        if !current_user
            redirect_to new_user_session_path
        end
      @current_page="My Account"
    end 

    def tools
      @current_page="Availables Tools for you"
        @quizTools =["purpose"]
        @questionTools =["purpose"]

        if current_user
            role=current_user.role
            if role=="admin"
                @quizTools =["create","listing"]   
                @questionTools =["create","listing"]    
 
            end
        end
    end
    def delete
        @quizz=Quiz.all
    end

    def modify
        @quizz=Quiz.all
    end

end
