class UsersController < ApplicationController
  def show
  	@user = User.find(current_user.id)
  	@books = @user.books
  	@book = Book.new
  end
end
