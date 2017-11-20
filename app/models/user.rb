class User < ApplicationRecord
	has_many :questions
	has_many :votes

  include Clearance::User

  def voted_for_question?(question_id:)
  	!Vote.find_by(question_id: question_id, user_id: self.id).nil?
  end
end
