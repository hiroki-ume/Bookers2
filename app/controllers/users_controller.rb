class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
  #                                         :following, :followers]

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
  		redirect
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
  def following
    @users  = User.find(params[:id])
    @user = @users.following_user


  end

  def followed
    @users  = User.find(params[:id])
    @user = @users.followed_user
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
