class CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.comments.new(comment_params)
    comment.book_id = book.id
    unless comment.save
      flash[:alert] = "コメントを入力してください"
    end
      redirect_to book_path(book)
  end
  def destroy
    book = Book.find(params[:book_id])
    comment = current_user.comments.find_by(params[:book_id])
    comment.destroy
    redirect_to book_path(book)
  end
  private
  def comment_params
    params.require(:comment).permit(:content, :book_id, :user_id)
  end
end
