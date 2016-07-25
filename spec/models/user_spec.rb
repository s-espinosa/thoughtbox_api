require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  context "validates uniqueness of email" do
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  context "has_many" do
    it { is_expected.to have_many(:links) }
  end
end
