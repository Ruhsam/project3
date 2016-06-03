class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]


   # GET /users
   # GET /users.json
   def index
      @users = redirect_to home_index_path
   end

   # GET /users/1
   # GET /users/1.json
   def show
      @user = User.find_by_id(params[:id])
      @appointments = @user.appointments.collect()
      render :show
   end

   # GET /users/new
   def new
      @user = User.new
   end

   # GET /users/1/edit
   def edit
   end

   def create
      user_params = params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password)
      @user = User.create(user_params)
      if @user.save
         login(@user) # <-- login the user
         redirect_to @user # <-- go to show
         return
      end
      redirect_to new_user_path
   end

   # PATCH/PUT /users/1
   # PATCH/PUT /users/1.json
   def update
      respond_to do |format|
         if @user.update(user_params)
            format.html { redirect_to @user, notice: 'User was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
         else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
         end
      end
   end

   # DELETE /users/1
   # DELETE /users/1.json
   def destroy
      @user = User.find(params[:id])
      @user.destroy
      respond_to do |format|
         format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
         format.json { head :no_content }
      end
   end

   private

   def set_user
      @user = User.find(params[:id])
   end

   def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
   end
end
