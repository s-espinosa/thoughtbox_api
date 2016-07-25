require 'rails_helper'

RSpec.feature "registered user can login" do
  scenario "guest logs in with valid information" do
    user = User.create(email: "admin@admin.com", password: "pass")
    visit '/'

    expect(page).to have_content("Log In")
    expect(page).to have_content("Sign Up")
    click_on "Log In"

    expect(current_path).to eq('/login')
    within(".login_form") do
      fill_in "Email", with: "admin@admin.com"
      fill_in "Password", with: "pass"
      click_on "Log In"
    end

    expect(current_path).to eq("/links")
  end
end
