class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :cocktail
      t.text :description
      t.string :photo
      t.string :date
      t.string :time
      t.text :address
      t.text :dessert
      t.text :course_1
      t.text :course_2
      t.text :course_3
      t.text :course4

      t.timestamps null: false
    end
  end
end
