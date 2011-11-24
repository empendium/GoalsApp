class User < ActiveRecord::Base
  
  has_secure_password

  has_many :reservations
  
  def miles
    total_miles = 0
    reservations.each do |reservation|
      total_miles = total_miles + reservation.flight.distance
    end
    total_miles
  end
  
end
