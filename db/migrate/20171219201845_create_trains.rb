class CreateTrains < ActiveRecord::Migration[5.1]
  def change
    create_table :trains do |t|
      t.string :number
      t.references :route, index: true
      t.references :railway_station, index: true
      t.timestamps
    end
  end
end
