class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    book_comment = current_user.book_comments.new(book_comment_params)
    book_comment.book_id = @book.id
    unless book_comment.comment.blank?
      book_comment.save
    else
      redirect_back fallback_location: root_path, notice: 'Comment cannot be blank.'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    book_comment.delete
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
