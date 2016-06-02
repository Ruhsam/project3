class AppointmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.appointment_created.subject
  #
  def appointment_created
    @greeting = "Hi"

    mail to: "ruhsam.dev@gmail.com"
  end
end
