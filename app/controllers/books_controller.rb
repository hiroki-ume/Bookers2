class BooksController < ApplicationController
	def top
	end
	def index
		@user = User.find(current_user.id)
		@book = Book.new
		@books = Book.all
	end
	def show
		@new_book = Book.new
		@book = Book.find(params[:id])
		@comment = Comment.new
		@comments = @book.comments
	end
	def create
		@book = Book.new(book_params)
		@books = Book.all
		@book.user_id = current_user.id
		@user = User.find(current_user.id)
		if @book.save
			flash[:success] = "You have creatad book successfully."
			redirect_to book_path(@book)
		else
			render :index
		end
	end
	def edit
		@book = Book.find(params[:id])
		unless @book.user.id == current_user.id
			redirect_to books_path
		end
	end
	def update
		book = Book.find(params[:id])
		if book.update(book_params)
			flash[:success] = "You have updated book successfully"
		else
			flash[:notice] = "You have error in your updating"
		end
		redirect_to book_path(book.id)
	end
	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end
	# 検索機能
	def search
		@user = User.find(current_user.id)
		@book = Book.new
		@books = Book.search(params[:q])
		render "index"
	end
	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
