require "rails_helper"

RSpec.describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_inclusion_of(:role).in_array(%w{admin stockholder manager}) }

  describe "#full_name" do
    it "returns the users full name" do
      subject.first_name = "Tony"
      subject.last_name = "Stark"
      expect(subject.full_name).to eq("Tony Stark")
    end
  end

  describe "#has_role?" do
    it "returns false when no role has been set" do
      expect(subject.has_role?("admin")).to be false
    end

    it "raises InvalidRole for roles that don't exist" do
      subject.role = "foo"
      expect{ subject.has_role?("foo") }.to raise_error(InvalidRole)
    end

    context "with admin role" do
      before { subject.role = "admin" }

      it "returns true" do
        expect(subject.has_role?("admin")).to be true
      end

      it "returns false for stockholder role" do
        expect(subject.has_role?("stockholder")).to be false
      end

      it "returns false for manager role" do
        expect(subject.has_role?("manager")).to be false
      end

      it "works passing symbols" do
        expect(subject.has_role?(:admin)).to be true
      end
    end
  end
end
