class AddTitleTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :title, :string
    add_column :events, :type, :string
  end
end
