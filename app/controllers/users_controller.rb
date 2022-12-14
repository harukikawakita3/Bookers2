class UsersController < ApplicationController




  def index
    @user=current_user
    @users=User.all
    @book=Book.new
  end

  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=Book.all
    @user_book=@user.books

  end

  def edit
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
     redirect_to user_path(current_user.id)
    end
     @user = User.find(params[:id])
    
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
