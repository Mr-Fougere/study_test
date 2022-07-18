class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :configure_devise_parameters, if: :devise_controller?


    
    def configure_devise_parameters
        @current_page="Bienvenue sur Qulbutoquiz"
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username,:email,:password,:password_confirmation)}
    end 
    end
