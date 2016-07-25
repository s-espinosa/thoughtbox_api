require 'rails_helper'

RSpec.feature "guest can create new account" do
  scenario "guest creates an account with valid information" do
    original_user_count = User.count

    visit '/'

    within(".login_form") do
      fill_in "Email", with: "user@user.com"
      fill_in "Password", with: "password"
      fill_in "Confirmation", with: "password"
      click_on "Create Account"
    end

    expect(User.count).to eq(original_user_count + 1)
    expect(current_path).to eq("/links")
  end
end
