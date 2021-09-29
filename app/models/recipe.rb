class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  attachment :image
  def tags_save(tag_list)
    if self.tags != nil
      recipe_tags_records = RecipeTag.where(recipe_id: self.id)
      recipe_tags_records.destroy_all
    end
    tag_list.each do |tag|
      inspected_tag = Tag.where(tag_name: tag).first_or_create
      self.tags << inspected_tag
    end

  end
end
