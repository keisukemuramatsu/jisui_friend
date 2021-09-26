class HomesController < ApplicationController
  def top
    @recipes = Recipe.last(4)
  end

end
