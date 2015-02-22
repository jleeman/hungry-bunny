class ChangeDate < ActiveRecord::Migration
  def change
    change_column :events, :date, :date
    change_column :events, :time, :time
  end
end
