class CreateIngredients < ActiveRecord::Migration
    def change
        create_table(:ingredients) do |i|
            i.column(:name, :string)
            i.timestamps()
        end
    end
end
