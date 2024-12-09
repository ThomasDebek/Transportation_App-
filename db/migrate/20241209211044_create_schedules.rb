class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.references :line, null: false, foreign_key: true
      t.references :stop, null: false, foreign_key: true
      t.string :direction
      t.time :time

      t.timestamps
    end
  end
end
