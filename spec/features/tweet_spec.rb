require 'spec_helper'

feature 'posting a new tweet' do
  scenario 'user posts a new tweet after logging in' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'user_handle', with: 'new test'
    fill_in 'Email', with: 'new_test@testy.com'
    fill_in 'Password', with: '12345'
    fill_in 'Password confirmation', with: '12345'
    click_button 'Create User'
    click_link 'Tweet'
    fill_in 'Tweet', with: 'hi everyone'
    click_button 'Create Tweet'
    expect(page).to have_content 'hi everyone'
  end
end
