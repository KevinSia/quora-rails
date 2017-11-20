class VotesController < ApplicationController
	def create
		@vote = current_user.votes.create(question_id: params[:question_id])
		flash[:notice] = 'You liked'
		redirect_to '/'
	end

	def destroy
		Vote.find_by(user_id: current_user.id, question_id: params[:question_id]).destroy
		flash[:notice] = 'You no liked'
		redirect_to '/'
	end
end