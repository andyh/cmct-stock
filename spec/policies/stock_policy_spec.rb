require "rails_helper"

RSpec.describe StockPolicy do
  subject { described_class }

  context "as a stockholder" do
    let(:user) { FactoryGirl.build(:user, :stockholder) }
    let(:record) { FactoryGirl.build(:stock) }

    %i(index? new? create?).each do |action|
      permissions action do
        it "grants access" do
          expect(subject).to permit(user, record)
        end
      end
    end
  end
end

