require "rails_helper"

RSpec.describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_inclusion_of(:role)
         .in_array(%w{admin stockholder manager}) }

  describe "#full_name" do
    it "returns the users full name" do
      subject.first_name = "Tony"
      subject.last_name = "Stark"
      expect(subject.full_name).to eq("Tony Stark")
    end
  end
end

