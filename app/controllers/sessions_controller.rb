class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by(email: params[:email])
		respond_to do |format|
			if user && user.authenticate(params[:password])
				format.html do
					session[:user_id]= user.id
					session[:email]= user.email
					redirect_to root_path
				end
				format.json {render json: user}
			else
				format.html do
					flash.now.alert = "Invalid email or password"
					render :new
				end
				format.json {render json: "Invalid email or password"}
			end
		end
	end

	def destroy
			session[:user_id]=nil
			redirect_to root_path, notice: "Logged Out!"
	end
end
