require 'rails_helper'

RSpec.describe Question, type: :model do
	before(:each) do
		@user = User.create!(email: 'asd@gmail.com', password: '123456')
	end

  describe 'validations' do
		it { is_expected.to validate_length_of(:title).is_at_least(5) }
		it { is_expected.to validate_presence_of(:title) }
		describe 'uniqueness' do
			# force uniqueness matcher to use custom created object instead
			# https://github.com/thoughtbot/shoulda-matchers/blob/master/lib/shoulda/matchers/active_record/validate_uniqueness_of_matcher.rb#L50
			subject { @user.questions.new(title: 'a' * 6, description: '123') }
			it { is_expected.to validate_uniqueness_of(:title) }
		end
	end

	describe 'associations' do
		it { is_expected.to have_many(:votes) }
		it { is_expected.to belong_to(:user) }
	end

	describe '#search' do
		before(:each) do
			@user.questions.create!(title: 'cats meow', description: 'asd')
			@user.questions.create!(title: 'dogs woof', description: 'qwe')
			@user.questions.create!(title: 'ducks quack', description: 'zxc')
		end

		it 'gives the questions that contains the term' do
			expect(Question.search('meow').count).to eq 1
		end

		it 'gives all the question instead if the term is not found' do
			expect(Question.search('space').count).to eq Question.count
		end
	end
end
