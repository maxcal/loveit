require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  let(:user) { create(:user) }
  scenario "when I log in" do
    visit root_path
    click_link "Log in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end

  scenario "when I log out" do
    login_as user
    visit root_path
    click_button "Log out"
    expect(page).to have_content "Signed out successfully."
  end
end
