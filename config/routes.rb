Rails.application.routes.draw do
	root 'static#index'

	resources :questions, except: [:new] do
		resources :votes, only: [:create]
	end
	delete 'questions/:question_id/downvote' => 'votes#destroy', as: :delete_vote
end
