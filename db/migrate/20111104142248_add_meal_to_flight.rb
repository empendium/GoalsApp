class AddMealToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :meal, :boolean, :default => false
  end
end
