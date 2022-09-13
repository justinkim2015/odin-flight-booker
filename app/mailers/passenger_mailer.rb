class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'FLIGHT CONFIRMATION')
  end
end
