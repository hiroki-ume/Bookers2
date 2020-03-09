class ApplicationController < ActionController::Base
	before_action :authenticate_user!, except: [:top, :about]
	def after_sign_in_path_for(resource)
    	user_path(current_user.id)
  	end
	before_action :configure_permitted_parameters,if: :devise_controller? 

	private
	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	end
	def redirect_root
  		redirect_to root_path unless user_signed_in?
  	end

end
