class UsersController < ApplicationController
  def index
    @book=Book.new
    @users=User.all
  end

  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
  end
  
  def update
    
  end
  
  private
  
  def user_params
    paramd.require(:user).permit(:name,:profile_image)
  end
end
