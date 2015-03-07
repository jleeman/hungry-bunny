class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.integer :step
      t.text :instruction
      t.references :recipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :instructions, :recipes
  end
end
