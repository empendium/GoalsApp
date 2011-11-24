class Flight < ActiveRecord::Base
  
  belongs_to :departure_airport, 
             :class_name => 'Airport', 
             :foreign_key => 'departure_airport_id'
  
  belongs_to :arrival_airport, 
             :class_name => 'Airport', 
             :foreign_key => 'arrival_airport_id'
  
  def duration
    distance / 6  # Assume we can go 6 miles per minute
  end
    
end
