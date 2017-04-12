class RemovePrimaryKey < ActiveRecord::Migration
  def change
    remove_column(:recipes_tags, :id, :integer)
    remove_column(:ingredients_recipes, :id, :integer)
  end
end
