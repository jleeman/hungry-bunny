class AddEventRefsToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :events, index: true
  end
end
