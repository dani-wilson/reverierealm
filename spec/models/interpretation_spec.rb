require "rails_helper"

RSpec.describe Interpretation, type: :model do
  describe "validations" do
    it { should validate_presence_of(:dream_id)}
    it { should validate_presence_of(:interpretation_content)}
  end

  describe "relationships" do
    it { should belong_to :dream }
  end
end