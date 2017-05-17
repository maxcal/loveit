require 'rails_helper'

RSpec.feature "Registrations", type: :feature do

  let(:attributes) { attributes_for(:user) }
  let(:user) { create(:user) }

  scenario "when I sign up with valid details" do
    visit root_path
    click_link 'Register'
    fill_in 'Email', with: attributes[:email]
    fill_in 'Password', with: attributes[:password]
    fill_in 'Password confirmation', with: attributes[:password]
    expect {
      click_button 'Sign up'
    }.to change(User, :count).by(+1)
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(current_path).to eq root_path
  end

  scenario "when I sign up with invalid details" do
    visit root_path
    click_link 'Register'
    fill_in 'Email', with: 'foo'
    expect {
      click_button 'Sign up'
    }.to_not change(User, :count)
    expect(page).to have_content 'errors prohibited this user from being saved'
    expect(current_path).to eq user_registration_path
  end

  scenario "when I edit my details" do
    login_as(user)
    visit root_path
    click_link 'My account'
    fill_in 'Email', with: attributes[:email]
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content 'Your account has been updated successfully.'
  end

  scenario "when I cancel my account" do
    login_as(user)
    visit root_path
    click_link 'My account'
    click_button 'Cancel my account'
    expect(page).to have_content 'Bye! Your account has been successfully cancelled. We hope to see you again soon.'
  end
end
