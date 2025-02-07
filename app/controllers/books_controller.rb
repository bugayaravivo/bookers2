class BooksController < ApplicationController
  def show
    @book=Book.new
    @books=Book.find(params[:id])
    @user=@books.user
  end

   def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def index
    @book=Book.new
    @books=Book.all
    @user=current_user
  end


  def create
    @book=Book.new(book_params)
    @user=current_user
    @book.user_id=current_user.id
    if @book.save
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :index
    end
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end
