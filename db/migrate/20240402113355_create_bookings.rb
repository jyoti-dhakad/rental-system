class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :pick_up
      t.date :drop_off
      t.string :pick_up_time
      t.string :drop_off_time
      t.references :vehicle, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
