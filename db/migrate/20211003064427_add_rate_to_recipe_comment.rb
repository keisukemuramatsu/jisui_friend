class AddRateToRecipeComment < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_comments, :rate, :float, null: false, default: 0
  end
end
