class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.references :train, index: true
      t.references :user, index: true

      t.string :end_station
      t.string :start_station

      t.timestamps
    end
  end
end
