require "rails_helper"

RSpec.describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_inclusion_of(:role)
         .in_array(%w{admin stockholder manager}) }
end

