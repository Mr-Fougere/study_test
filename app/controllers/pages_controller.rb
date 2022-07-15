class PagesController < ApplicationController

    def metronome

    end

    def help
    
    end

    def user 

    end 

    def tools

        @quizTools =["purpose"]
        @questionTools =["purpose"]

        if current_user
            role=current_user.role
            if role=="admin"
                @quizTools =["create","modify","delete"]   
                @questionTools =["create","delete"]    
 
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