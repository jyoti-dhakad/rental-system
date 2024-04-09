class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :model_number
      t.float :rent_price
      t.string :picture
      t.boolean :insurance

      t.timestamps
    end
  end
end
