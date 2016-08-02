require "rails_helper"

RSpec.feature "registered user can edit link read status" do
  before(:all) do
    User.create(email: "admin@admin.com", password: "pass")
    @user = User.find_by(email: "admin@admin.com")
    @link = Link.create(url: "http://google.com", title: "Google", user_id: @user.id)
  end

  scenario "clicking on 'read' marks a link as read", :js => true do
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    visit links_path
    within("table") do
      expect(page).to have_content "Google"
    end

    expect(page).to have_content("false")
    page.find(:css, "#read-#{@link.id}").click()
    expect(page).to have_content("true")
  end
end
