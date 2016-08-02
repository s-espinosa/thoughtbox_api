require "rails_helper"

RSpec.feature "registered user can create links" do
  scenario "registered user creates new link" do
    User.create(email: "admin@admin.com", password: "pass")
    visit login_path
    fill_in "Email", with: "admin@admin.com"
    fill_in "Password", with: "pass"
    click_on "Log In"

    fill_in "link[url]", with: "http://google.com"
    fill_in "link[title]", with: "Google"
    click_on "Add Link"

    expect(current_path).to eq("/links")
    expect(page).to have_content("Google")
  end
end
