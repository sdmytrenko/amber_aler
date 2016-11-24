class EmergenciesController < ApplicationController

	before_filter :find_emergency, only: [:edit, :update, :show, :destroy]

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
	end

	def update
		if @emergency.update(page_params)
			redirect_to emergencies_path
		else
			render :edit
		end
	end

	def show
	end

	def destroy
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

		def find_emergency
			@emergency = Emergency.find(params[:id])
		end

end
