class EmergenciesController < ApplicationController

	def new
		@emergency = Emergency.new
	end

	def create
		@emergency = Emergency.new(page_params)
		if @emergency.save
			redirect_to emergencies_path
		else
			render :new
		end
	end

	def index
		@emergencies = Emergency.all
	end

	def edit
		@emergency = Emergency.find(:id)
	end

	def edit
		
	end

	def update
		
	end

	def show
		
	end

	def destroy
		
	end

	private
		def page_params
			params[:emergency].permit(:title, :description)
		end

end
