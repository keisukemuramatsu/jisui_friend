class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end
  def index
    @recipes = Recipe.page(params[:page]).reverse_order
  end
  def show
    @recipe = Recipe.find(params[:id])
  end
  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.user == current_user
     render :edit
    else
     redirect_to recipes_path, notice: "ほかのユーザーのレシピは編集できません。"
    end
  end
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe.id), notice: "編集しました。"
  end
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to recipes_path, notice: "登録しました."
  end
  def delete
  end
  private
  def recipe_params
    params.require(:recipe).permit(:title, :image, :foodstuff, :instructions, :impression, :user_id)
  end
end
