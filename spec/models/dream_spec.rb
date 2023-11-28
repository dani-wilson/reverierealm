require "rails_helper"

RSpec.describe Dream, type: :model do
  describe "validations" do
    it { should validate_presence_of(:dream_title) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:dream_content) }
    it { should validate_presence_of(:dream_date) }
    it { should validate_presence_of(:privacy_setting) }
    it { should validate_presence_of(:favorite) }
    it { should validate_presence_of(:additional_insights) }
  end

  describe "relationships" do
    it { should belong_to :user }
  end
end