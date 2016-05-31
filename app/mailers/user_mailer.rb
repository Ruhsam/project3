class UserMailer < ApplicationMailer
   # mail to: user.email, subject: "Registered Account"
   def new
      @user = user
      mail to: user.email, subject: "Registered Account"
   end
end
