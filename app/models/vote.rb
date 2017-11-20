class Vote < ApplicationRecord
	validates :user_id, uniqueness: { scope: :question_id }

  belongs_to :user
  belongs_to :question, counter_cache: :vote_count
end
