class AddEvaluationToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :evaluation, :float
  end
end
