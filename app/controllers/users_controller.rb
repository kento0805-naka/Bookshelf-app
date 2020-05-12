class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
    counts(@user)
    # @get_all_books = User.userbooks.all(status: 1)
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:success] = 'プロフィールを更新しました。'
      redirect_to user_path
    else
      flash[:danger] = 'プロフィールを更新できませんでした'
      redirect_to edit_user_path
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
    counts(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:profile_img, :description)
  end
  
  
end
