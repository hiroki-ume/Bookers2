class UsersController < ApplicationController
  def index
	@user = User.find(current_user.id)
	@book = Book.new
	@users = User.all
  end
  def show
  	@user = User.find(current_user.id)
  	@book = Book.new
  	@users = User.find(params[:id])
   	@books = @users.books
  end
  def edit
  	@user = User.find(params[:id])
  	unless @user.id == current_user.id
  		redirect_to user_path(current_user.id)
  	end
  end
  def update
  	user = User.find(params[:id])
  	if user.update(user_params)
  		flash[:success] = "You have update your profile successfully."
  	else
  		flash[:notice] = "You have error in your updating."
  	end
  	redirect_to user_path(user.id)
  end
  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
