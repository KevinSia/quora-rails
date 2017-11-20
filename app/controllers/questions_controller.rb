class QuestionsController < ApplicationController
	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to '/'
		else
			render :new
		end
	end

	private

	def question_params
		params.require(:question).permit(:title, :description)
	end
end
