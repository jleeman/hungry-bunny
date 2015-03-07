class AddForeignKeyToCourses < ActiveRecord::Migration
  def change
    add_foreign_key :courses, :events, on_delete: :cascade
  end
end
