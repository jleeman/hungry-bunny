class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.integer :num_guests
      t.text :message
      t.string :first_name
      t.string :last_name
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :reservations, :events, on_delete: :cascade
  end
end
