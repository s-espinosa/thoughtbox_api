require "rails_helper"

RSpec.feature "registered user can edit links" do
  before(:all) do
    User.create(email: "admin@admin.com", password: "pass")
    @user = User.find_by(email: "admin@admin.com")
    @link = Link.create(url: "http://google.com", title: "Google", user_id: @user.id)
  end

  scenario "registered user updates link title" do
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    visit links_path
    within("table") do
      expect(page).to have_content "Google"
    end

    page.find(:css, "#edit-#{@link.id}").click()
    fill_in "link[title]", with: "New Title"
    click_on "Edit Link"

    expect(current_path).to eq("/links")
    expect(page).to have_content("Link successfully updated!")
  end
end
