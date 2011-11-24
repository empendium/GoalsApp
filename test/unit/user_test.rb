require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.create :email => 'cookie@codeacademy.org', :password => 'cookies', :password_confirmation => 'cookies'
    chicago = Airport.create :code => "ORD"
    @new_york = Airport.create :code => "JFK"
    flight = Flight.new :departure_airport => chicago, :arrival_airport => @new_york, :distance => 400, :number => '123', :departs_at => 3.hours.ago
    @reservation = @user.reservations.create :flight => flight, :user => @user, :travels_on => Date.today, :card_number => '123456'
  end
  
  test "a user should have earn miles" do
    assert_equal 400, @user.miles
  end

  test "a user should have earn miles from multiple flights" do
    lax = Airport.create :code => "LAX"
    flight2 = Flight.new :departure_airport => lax, :arrival_airport => @new_york, :distance => 900, :number => '123', :departs_at => 3.hours.ago
    reservation2 = @user.reservations.create :flight => flight2, :user => @user, :travels_on => Date.today, :card_number => '123456'
    
    assert_equal 1300, @user.miles
  end
  
  

end
