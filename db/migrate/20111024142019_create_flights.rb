class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :number
      t.time :departs_at
      t.integer :departure_airport_id
      t.integer :arrrival_airport_id
      t.integer :distance

      t.timestamps
    end
  end
end
