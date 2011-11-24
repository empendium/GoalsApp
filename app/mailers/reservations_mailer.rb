class ReservationsMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  
  def send_confirmation(reservation)
    @reservation = reservation
    
    mail :from => "jeff@codeacademy.org",
         :to => @reservation.user.email,
         :subject => "New Reservation"
  end
  
end
