class CreateStops < ActiveRecord::Migration[8.0]
  def change
    create_table :stops do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.boolean :on_demand

      t.timestamps
    end
  end
end
