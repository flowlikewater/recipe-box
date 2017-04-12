1. Git clone ....
2. Enter folder tree
3. Type - rake db:create
4. Type - rake db:create_migration NAME=create_ingredients
5. Open /db/migrate/...create_ingredients.rb, fill in the following:
    class CreateIngredients < ActiveRecord::Migration
      def change
        create_table(:ingredients) do |i|
          i.column(:name, :string)
          i.timestamps()
        end
      end
    end
6. In command line, run rake db:migrate
7. In command line, type - rake db:create_migration NAME=create_recipes
8. Open /db/migrate/...create_recipes.rb, fill in the following:
    class CreateRecipes < ActiveRecord::Migration
      def change
        create_table(:recipes) do |r|
          r.column(:name, :string)
          r.column(:rate, :integer)
          r.timestamps()
        end
      end
    end
9. In command line, run rake db:migrate
10. In command line, type - rake db:create_migration NAME=create_tags
11. Open /db/migrate/...create_tags.rb, fill in the following:
    class CreateTags < ActiveRecord::Migration
      def change
        create_table(:tags) do |t|
          t.column(:name, :string)
          t.timestamps()
        end
      end
    end
12. In command line, run rake db:migrate
13. In command line, run rake db:create_migration NAME=create_ingredients_recipes
