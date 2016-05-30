class AppointmentsController < ApplicationController
  def create
  end

  def delete
  end

  def availability
     req_date=Date.strptime(params[:date], "%m/%d/%Y")
     date_check=Appointment.all.where(date:req_date)


     time_check=date_check.map{|appointment| appointment.time}

     render json:{tests:time_check}
     return
  end
end
