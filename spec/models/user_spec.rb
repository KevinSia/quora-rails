require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'validation' do
	end

	describe 'association' do
		it { is_expected.to have_many(:questions) }
		it { is_expected.to have_many(:votes) }
	end

	describe '#voted_for_question' do
		before(:each) do
			@user = User.create!(email: 'example@quora.com', password: '123456')
			@question = @user.questions.create!(title: 'Something', description: 'Something')
			Vote.create!(user_id: @user.id, question_id: @question.id)
		end

		it "returns true if the user has voted for a question" do
			expect(@user.voted_for_question?(question_id: @question.id)).to eq true
		end

		it "returns false if the user has not voted for the question" do
			user = User.create!(email: 'example2@quora.com', password: '123456')
			question = user.questions.create(title: 'Something else', description: 'Something else')
			expect(@user.voted_for_question?(question_id: question.id)).to eq false
		end
	end
end
