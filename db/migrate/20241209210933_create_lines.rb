class CreateLines < ActiveRecord::Migration[8.0]
  def change
    create_table :lines do |t|
      t.string :name
      t.string :type_of_vehicle
      t.boolean :low_floor

      t.timestamps
    end
  end
end
