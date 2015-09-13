require "rails_helper"

RSpec.describe Product, type: :model do
  it { is_expected.to belong_to(:brand) }
  it { is_expected.to belong_to(:category) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:brand) }
  it { is_expected.to validate_presence_of(:category) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  it { is_expected.to delegate_method(:name).to(:brand).with_prefix(true) }
  it { is_expected.to delegate_method(:name).to(:category).with_prefix(true) }
end
