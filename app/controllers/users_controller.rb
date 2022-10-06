class UsersController < ApplicationController
  
  def index
    @user=current_user
    @users=User.all
  end
  
  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=Book.all
    @book_show=Book.find(params[:id])
    
    
  end

  def edit
  end
end
