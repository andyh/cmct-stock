require "rails_helper"

RSpec.describe UserPolicy do
  subject { described_class }

  context "with an admin" do
    let(:user) { FactoryGirl.build(:admin) }
    let(:record) { FactoryGirl.build(:admin) }

    %i(index? new? create? edit? update? destroy?).each do |action|
      permissions action do
        it "grants access" do
          expect(subject).to permit(user, record)
        end
      end
    end

    permissions :show? do
      it "grants access to persisted users" do
        expect(subject).to permit(user, FactoryGirl.create(:user) )
      end

      it "prevents access to non-existent users" do
        expect(subject).not_to permit(user, FactoryGirl.build(:user) )
      end
    end
  end

  context "as a stockholder" do

  end
end
