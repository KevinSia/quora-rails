class Question < ApplicationRecord
	validates :title, length: { minimum: 5 }, uniqueness: true, presence: true
	validates :description, length: { maximum: 140 }, presence: true

	# callback
	before_save :capitalize_title

	has_many :votes
	belongs_to :user

	def self.search(term)
		term = term.downcase
		questions = Question.where('LOWER(title) LIKE ? or LOWER(description) LIKE ?', "%#{term}%", "%#{term}%")
		if questions.count > 0
			questions
		else
			self.all
		end
	end

	private

	def capitalize_title
		self.title = title.capitalize
	end
end
