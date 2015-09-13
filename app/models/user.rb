class InvalidRole < StandardError; end

class User < ActiveRecord::Base

  include Clearance::User
  VALID_ROLES = %w{stockholder manager admin}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, inclusion: VALID_ROLES

  def full_name
    [first_name, last_name].join(" ")
  end

  def has_role?(role_to_check)
    raise InvalidRole.new("Role does not exist") unless role_to_check.to_s.in?(VALID_ROLES)
    role_to_check.to_s == role
  end
end

