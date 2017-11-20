require 'rails_helper'

RSpec.describe Vote, type: :model do
	before(:each) do
		@user = User.create!(email: '1@example.com', password: '123456')
	end

	describe 'validations' do
		subject { Vote.new(user_id: @user.id) }
		it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:question_id) }
	end

	describe 'associations' do
		it { is_expected.to belong_to(:user) }
		it { is_expected.to belong_to(:question).counter_cache(:vote_count) }
	end
end
