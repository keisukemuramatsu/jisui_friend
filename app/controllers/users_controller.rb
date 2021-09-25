class UsersController < ApplicationController
  def show
  end
  def index
  end
  def edit
    @user = User.find(params[:id])
    if @user == current_user
     render :edit
    else
     redirect_to users_path, notice: "ほかのユーザー情報は編集できません。"
    end
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path, notice: "編集しました。"
  end
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
