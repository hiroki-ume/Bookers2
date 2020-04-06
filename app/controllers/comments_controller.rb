class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    # @comments = book.comments
    @comment = @book.comments.build(comment_params)
    @comment.user_id = current_user.id

    # unless @comment.save
    #   flash[:alert] = "コメントを入力してください"
    # end
    @comment.save
    # @comments = @book.comments
    render :show
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
