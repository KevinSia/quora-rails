class AddVoteCountToQuestions < ActiveRecord::Migration[5.1]
  def up
    add_column :questions, :vote_count, :integer, default: 0

    Question.all.each do |q|
    	vote_count = q.votes.count
    	q.update(vote_count: vote_count)
    end
  end

  def down
  	remove_column :questions, :vote_count, :integer
  end
end
