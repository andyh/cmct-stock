require "rails_helper"

RSpec.describe DashboardPolicy do
  subject { described_class }

  context "with a stockholder" do
    let(:user) { FactoryGirl.build(:user, :stockholder) }

    permissions :show? do
      it "grants access" do
        expect(subject).to permit(user, :dashboard)
      end
    end
  end
end
