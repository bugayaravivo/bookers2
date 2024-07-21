class BooksController < ApplicationController
  def show
    @book=Book.new
    @books=Book.find(params[:id])
    @user=@books.user
  end

  def index
    @book=Book.new
    @books=Book.all
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end
