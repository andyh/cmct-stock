class User < ActiveRecord::Base
  include Clearance::User
  VALID_ROLES = %w{stockholder manager admin}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, inclusion: VALID_ROLES

  def full_name
    [first_name, last_name].join(" ")
  end
end
