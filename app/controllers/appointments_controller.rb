class AppointmentsController < ApplicationController
  def create
  end

  def delete
  end

  def availability
     req_date=Date.strptime(params[:date], "%m/%d/%Y")
     date_check=Appointment.find_by(date:req_date)
     render json:{tests:date_check}
     return
  end
end
