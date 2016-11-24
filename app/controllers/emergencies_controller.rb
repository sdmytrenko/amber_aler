class EmergenciesController < ApplicationController

	def index
		@emergencies = Emergency.all
	end





end
