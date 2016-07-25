require "rails_helper"

RSpec.describe "PUT /api/v1/links" do
  it "updates a link read property" do
    user = User.create(email: "admin@admin.com", password: "pass")
    link = Link.create(url: "http://google.com", title: "Google")
    expect(link.read).to eq(false)

    put "/api/v1/links/#{link.id}?read=true"

    updated_link = Link.find(link.id)
    expect(updated_link.read).to eq(true)
  end
end
