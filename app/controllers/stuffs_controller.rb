class StuffsController < ApplicationController
	before_action :authorize, except: [:index, :show, :create,:new]

	def new
		@stuff = Stuff.new
		@statuses = Stuff.statuses	
	end

	def index

		@stuff = Stuff.all
		@statuses = Stuff.statuses
		@decline=Stuff.decline
		@confirm=Stuff.confirm
		@waiting=Stuff.waiting

		@filterrific = Filterrific.new(Stuff, params[:filterrific])
		@filterrific.select_options = {
			#sorted_by: Student.options_for_sorted_by,
			with_gender: Gender.options_for_select
		}
		@stuff = Stuff.filterrific_find(@filterrific).page(params[:page])
		@confirm = Stuff.confirm.filterrific_find(@filterrific).page(params[:page])	
		respond_to do |format|
			format.html
			format.json {render json: @stuff }
			format.xml {render xml: @stuff }
		end
	end
	def dashboard
		@stuff = Stuff.all
		@statuses = Stuff.statuses
		@decline=Stuff.decline
		@confirm=Stuff.confirm
		@waiting=Stuff.waiting

	end
	def create
		stuff = Stuff.find_by(email: params[:stuff][:email])
		respond_to do |format|
			
			if current_user 
				@stuff = Stuff.new(params.require(:stuff).permit(:gender_id,:name, :alamat, :price, :gender_name, :picture, :desc, :nohp, :longitude, :latitude, :picture1, :picture2,:gender_id,:status, :jumlahKamar, :jumlahWC, :namaAnda, :email,:confirm_date))

				#respond_to do |format|
				if @stuff.save
					format.html { redirect_to root_path, notice: 'Idea was successfully created.' }
					format.json { render :index, status: :created, location: @stuff }
				else
					format.html { render :new }
					format.json { render json: @stuff.errors, status: :unprocessable_entity }
				end
				
				

			else if stuff
				format.html do
					redirect_to new_user_path
					@stuff = Stuff.new(params.require(:stuff).permit(:gender_id,:name, :alamat, :price, :gender_name, :picture, :desc, :nohp, :longitude, :latitude, :picture1, :picture2,:gender_id,:status, :jumlahKamar, :jumlahWC, :namaAnda, :email,:confirm_date))

				#respond_to do |format|
				if @stuff.save
					format.html { redirect_to root_path, notice: 'Idea was successfully created.' }
					format.json { render :index, status: :created, location: @stuff }
				else
					format.html { render :new }
					format.json { render json: @stuff.errors, status: :unprocessable_entity }
				end
				end
				format.json {render json: user}


			else
				@stuff = Stuff.new(params.require(:stuff).permit(:gender_id,:name, :alamat, :price, :gender_name, :picture, :desc, :nohp, :longitude, :latitude, :picture1, :picture2,:gender_id,:status, :jumlahKamar, :jumlahWC, :namaAnda, :email,:confirm_date))

				#respond_to do |format|
				if @stuff.save
					format.html { redirect_to root_path, notice: 'Idea was successfully created.' }
					format.json { render :index, status: :created, location: @stuff }
				else
					format.html { render :new }
					format.json { render json: @stuff.errors, status: :unprocessable_entity }
				end
			end
		end
	end
end


def history
	@histories = Stuff.all.where(["email = ?", current_user[:email]])

end
def extend
	@stuff = Stuff.find(params[:id])
	@statuses = Stuff.statuses
	
end


def show
	@stuff = Stuff.find(params[:id])
	@statuses = Stuff.statuses
end

def update

	@stuff = Stuff.find(params[:id])
	@statuses = Stuff.statuses
	@stuff.update(params.require(:stuff).permit(:name, :alamat, :gender_id,:price, :picture, :desc, :nohp, :longitude, :latitude, :picture1, :picture2, :status,:confirm_date))
	
	redirect_to root_path

end

def edit
	@stuff = Stuff.find(params[:id])
	@statuses = Stuff.statuses
end

def destroy
	stuff = Stuff.find(params[:id])
	stuff.destroy
	redirect_to root_path
end

def status
	@statuses = Stuff.statuses
end



end