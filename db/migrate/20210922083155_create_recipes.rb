class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :image_id
      t.text :foodstuff
      t.text :instructions
      t.text :impression
      t.integer :user_id

      t.timestamps
    end
  end
end
