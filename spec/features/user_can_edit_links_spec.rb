require "rails_helper"

RSpec.feature "registered user can edit links" do
  scenario "registered user updates link title" do
    user = User.create(email: "admin@admin.com", password: "pass")
    link = Link.create(url: "http://google.com", title: "Google", user_id: user.id)
    visit login_path
    fill_in "Email", with: "admin@admin.com"
    fill_in "Password", with: "pass"
    click_on "Log In"
    within("table") do
      expect(page).to have_content "Google"
    end

    within("##{link.id}") do
      click_on("Edit")
    end
    fill_in "link[title]", with: "New Title"
    click_on "Edit Link"

    expect(current_path).to eq("/links")
    expect(page).to have_content("New Title")
  end
end
