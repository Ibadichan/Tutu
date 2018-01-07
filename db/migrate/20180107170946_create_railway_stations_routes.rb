class CreateRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :railway_stations_routes do |t|
      t.references :route, index: true
      t.references :railway_station, index: true
    end
  end
end
