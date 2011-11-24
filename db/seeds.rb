# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Create a user
User.destroy_all
User.create :email => "cookie@codeacademy.org", 
            :first_name => "Cookie", 
            :last_name => "Monster", 
            :street => "123 Sesame St", 
            :city => "Chicago", :state => "IL", :zip => "60654", 
            :password => "cookies", :password_confirmation => "cookies"
puts "Created one user: email => '#{User.first.email}', password => 'cookies'"

# Create a list of airports in our database
airports = { 'ORD' => 'Chicago', 'JFK' => 'New York', 'BOS' => 'Boston', 'LAX' => 'Los Angeles', 'PDX' => 'Portland' }
Airport.destroy_all
airports.each do |airport_code, airport_city|
  Airport.create :code => airport_code, :city => airport_city
end
puts "Created #{Airport.count} airports"

# Create a list of flights in our database
# We're going to generate a list somewhat randomly
# We'll create up to three random flights out of each airport
Flight.destroy_all

Airport.all.each do |origin_airport|
  12.times do 
    other_airport = Airport.all.choice
    if other_airport != origin_airport
      departing_hour = rand(12)+1
      distance = rand(600)+300
      Flight.create :number => rand(9999)+1,
                    :departure_airport => origin_airport,
                    :arrival_airport => other_airport,
                    :departs_at => "#{departing_hour}:#{rand(50)+10} #{departing_hour < 6 ? "pm" : "am" }",
                    :distance => distance,
                    :meal => (distance > 400)
    end
  end
end
puts "Created #{Flight.count} flights"