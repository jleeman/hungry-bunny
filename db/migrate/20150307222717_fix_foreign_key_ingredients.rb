class FixForeignKeyIngredients < ActiveRecord::Migration
  def change
    remove_foreign_key :ingredients, :recipes
    add_foreign_key :ingredients, :recipes, on_delete: :cascade
  end
end
