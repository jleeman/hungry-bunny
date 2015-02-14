class ChangeCourse4 < ActiveRecord::Migration
  def change
    rename_column :events, :course4, :course_4
  end
end
