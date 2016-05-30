class AppointmentsController < ApplicationController
  def create
  end

  def delete
  end

  def availability
     req_date=Date.strptime(params[:date], "%m/%d/%Y")
     week_day=req_date.wday
     time_check=Appointment.all.where(date:req_date).pluck(:time)
   #   time_check=date_check.map{|appointment| appointment.time}
     work_hour_check=WorkHour.where(week_day:week_day).where.not(hour: [time_check]).pluck(:hour)
   #   render json:{tests:time_check}
     render json:work_hour_check
     return
  end
end
