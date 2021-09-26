class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @allrecipes = @user.recipes.count
  end
  def index
    @users = User.page(params[:page]).reverse_order
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
    redirect_to user_path(@user), notice: "編集しました。"
  end
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
