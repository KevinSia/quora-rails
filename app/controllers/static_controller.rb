class StaticController < ApplicationController
	before_action :require_login, only: [:index]

	def index
		@questions = 
			if params[:term]
				Question.search(params[:term]).order(created_at: :desc)
			else
		 		Question.all.order(created_at: :desc)
		 	end
	end	
end