class UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
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
  
  private
  
  def user_params
    params.require(:user).permit(:profile_img, :description)
  end
  
  
end
