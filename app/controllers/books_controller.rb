class BooksController < ApplicationController
	def top
	end
	def index
		@user = User.find(current_user.id)
		@book = Book.new
		@books = Book.all
	end
	def show
		@user = User.find(current_user.id)
		@book = Book.find(params[:id])
	end
	def new
		@book = Book.new
	end
	def create
		book = Book.new(book_params)
		book.user_id = current_user.id
		book.save
		flash[:success] = "You have creatad book successfully."
		redirect_to book_path(book.id)
	end
	def edit
		@book = Book.find(params[:id])
	end
	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to book_path(book.id)
	end
	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end
	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
