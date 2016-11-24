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
		@emergency = Emergency.find(params[:id])
	end

	def update
		@emergency = Emergency.find(params[:id])
		if @emergency.update(page_params)
			redirect_to emergencies_path
		else
			render :edit
		end
	end

	def show
		@emergency = Emergency.find(params[:id])
	end

	def destroy
		@emergency = Emergency.find(params[:id])
		if @emergency.destroy
			redirect_to emergencies_path
		else
			redirect_to emergencies_path, errors: 'Something goes wrong'
		end
	end

	private
		def page_params
			params[:emergency].permit(:title, :description)
		end

end
