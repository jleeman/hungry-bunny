class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :cocktail
      t.text :title
      t.text :description
      t.string :photo
      t.date :event_date
      t.time :event_time
      t.string :event_type
      t.text :address
      t.text :dessert
      t.text :course_1
      t.text :course_2
      t.text :course_3
      t.text :course_4

      t.timestamps null: false
    end
  end
end
