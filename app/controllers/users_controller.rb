class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create

		@user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
		
		respond_to do |format|
			if @user.save
				format.html do
					
					session[:user_id]=@user.id
					redirect_to root_path, 
					notice: 'success'
				end
				format.json {render json: user}
			else
				format.html do
					render :new
				end
				format.json {render json: "Invalid email or password"}
			end
		end

	end
end
