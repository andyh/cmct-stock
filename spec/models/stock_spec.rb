require "rails_helper"

RSpec.describe Stock, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:product) }
  it { is_expected.to validate_presence_of(:quantity) }
  it do
    is_expected.to validate_numericality_of(:quantity)
                              .only_integer
                              .is_greater_than(0)
  end
end
