class FixForeignKeyInstructions < ActiveRecord::Migration
  def change
    remove_foreign_key :instructions, :recipes
    add_foreign_key :instructions, :recipes, on_delete: :cascade
  end
end
