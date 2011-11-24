class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :flight_id
      t.date :travels_on
      t.string :card_number

      t.timestamps
    end
  end
end
