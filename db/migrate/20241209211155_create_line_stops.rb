class CreateLineStops < ActiveRecord::Migration[8.0]
  def change
    create_table :line_stops do |t|
      t.references :line, null: false, foreign_key: true
      t.references :stop, null: false, foreign_key: true
      t.integer :sequence

      t.timestamps
    end
  end
end
