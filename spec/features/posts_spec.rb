require 'rails_helper'

RSpec.feature "Posts", type: :feature do

  context "index" do
    let!(:posts) { create_list(:post, 5) }
    scenario "when I visit the root path" do
      visit root_path
      expect(page).to have_content posts.last.title
    end
  end

  context "creating" do
    background do
      login_as user
      visit root_path
      click_link "New Post"
    end
    let(:valid_attributes) { attributes_for(:post) }
    scenario "when I create a post with valid attributes" do
      fill_in "Title", with: valid_attributes[:title]
      fill_in "Body", with: valid_attributes[:title]
      expect {
        click_button "Create Post"
      }.to change(Post, :count).by(+1)
      expect(page).to have_content valid_attributes[:title]
      expect(page).to have_content "Post was successfully created."
    end
    scenario "when I create a post with invalid attributes" do
      fill_in "Title", with: ""
      fill_in "Body", with: ""
      expect {
        click_button "Create Post"
      }.to_not change(Post, :count)
      expect(page).to_not have_content "Post was successfully created."
    end
  end

  context "editing" do
    let!(:post) { create(:post, author: user) }
    background do
      login_as user
      visit root_path
      click_link "Edit"
    end

    scenario "when I edit a post with invalid attributes" do
      fill_in "Title", with: ""
      click_button "Update Post"
      expect(page).to have_content "Please review the problems below:"
      expect(page).to_not have_content "Post was successfully updated."
    end
  end

  context "destroying" do
    let!(:post) { create(:post, author: user) }
    background do
      login_as user
      visit root_path
    end

    scenario "when I delete a post" do
      click_link "Delete"
      expect(page).to have_content "Post was successfully destroyed."
      expect(page).to_not have_content post.title
    end
  end
end
