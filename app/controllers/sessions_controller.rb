class SessionsController < ApplicationController

   def create
      user_params = params.require(:user).permit(:email, :password)
      @user = User.confirm(user_params)
      if @user
         login(@user)
         flash[:notice] = "Successfully logged in."
         redirect_to @user
      else
         flash[:error] = "Incorrect email or password."
         redirect_to home_index_path
      end
   end

   def destroy
      logout # this method lives in the SessionsHelper!
      redirect_to home_index_path
      flash[:notice] = "Successfully logged out."
   end
end
