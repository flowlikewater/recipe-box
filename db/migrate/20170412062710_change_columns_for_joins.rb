class ChangeColumnsForJoins < ActiveRecord::Migration
  def change
    remove_column(:ingredients_recipes, :created_at, :datetime)
    remove_column(:ingredients_recipes, :updated_at, :datetime)
    remove_column(:recipes_tags, :created_at, :datetime)
    remove_column(:recipes_tags, :updated_at, :datetime)
  end
end
