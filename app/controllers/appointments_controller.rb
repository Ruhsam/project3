class AppointmentsController < ApplicationController
   def index
      @user = User.find_by_id(params[:id])
      @appointments = User.appointments
      if current_user == @user
         render :index
      # else
      #    redirect_to home_index_path
      end
   end
   def create
      appointment = Appointment.new(appointment_params)
      appointment.user = current_user
      appointment.save
      flash[:success] = "Appointment created!"
      redirect_to user_path(current_user)
   end

   def destroy
      @appointment = appointment.find(params[:id])
      @user = @appointment.user
      if current_user == @user
         @user.appointments.destroy(@appointment)
         flash[:success] = "Appointment Canceled!"
         redirect_to @user
      else
         flash[:error] = "Must log in to Cancel the Appointment"
         redirect_to home_path
      end
   end

   def availability
      req_date=Date.strptime(params[:date], "%m/%d/%Y")
      week_day=req_date.wday
      time_check=Appointment.all.where(date:req_date).pluck(:time)

      work_hour_check=WorkHour.where(week_day:week_day).where.not(hour: [time_check]).pluck(:hour)

      render json:work_hour_check
      return
   end

   private

   def appointment_params
      params.permit(:date, :time, :reason_for_visit)
   end
end
