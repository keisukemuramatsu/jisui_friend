class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end
  def index
    @recipes = Recipe.all
  end
  def show
  end
  def edit
  end
  def update
  end
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to root_path, notice: "登録しました."
  end
  def delete
  end
  private
  def recipe_params
    params.require(:recipe).permit(:title, :image, :foodstuff, :instructions, :impression, :user_id)
  end
end
