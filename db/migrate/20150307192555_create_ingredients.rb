class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :title
      t.string :amount
      t.text :prep_method
      t.references :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :ingredients, :recipes
  end
end
