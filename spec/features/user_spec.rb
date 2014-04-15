require 'spec_helper'

feature 'signing up for a new Atwitter account' do
  scenario 'new user sign up' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'user_handle', with: 'new test'
    fill_in 'Email', with: 'new_test@testy.com'
    fill_in 'Password', with: '12345'
    fill_in 'Password confirmation', with: '12345'
    click_button 'Create User'
    expect(page).to have_content 'Thanks for signing up!'
  end
end




