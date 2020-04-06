class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @favorite = Favorite.create(user_id: current_user.id, book_id: @book.id)
    #
    # favorite = current_user.favorites.new(book_id: book.id)
    # favorite.save
  end
  def destroy
    @book = Book.find(params[:book_id])
    # favorite = current_user.favorites.find_by(book_id: book.id)
    # favorite.destroy
    @favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id).destroy
    
  end
end
