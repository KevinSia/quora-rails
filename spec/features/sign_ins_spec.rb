require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
  describe 'sign in' do
  	before(:each) do
  		User.create(email: 'kevin@example.com', password: 1234567)
  	end

  	it 'signs me in and show homepage title' do
  		visit '/sign_in'
  		within('form[action="/session"]') do
  			find('#session_email').set('kevin@example.com')
				find('#session_password').set('1234567')
  		end
  		click_button 'Sign in'
  		expect(page).to have_content "Very 'nice' homepage"
  	end
  end
end
