class ChangeTypetoMealType < ActiveRecord::Migration
  def change
    rename_column :events, :type, :event_type
    rename_column :events, :date, :event_date
    rename_column :events, :time, :event_time
  end
end
