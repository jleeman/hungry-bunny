class FixEventsinCourses < ActiveRecord::Migration
  def change
    rename_column :courses, :events_id, :event_id
  end
end
