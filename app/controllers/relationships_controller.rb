class RelationshipsController < ApplicationController
  # before_action :logged_in?

 def follow
   current_user.follow(params[:id])
   redirect_back(fallback_location: root_path)
 end

 def unfollow
   current_user.unfollow(params[:id])
   redirect_back(fallback_location: root_path)
 end
 # private
 # def logged_in?
 #   current_user_signed_in?
 # end

end
