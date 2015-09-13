class AuthenticatedController < ApplicationController
  include Pundit
  before_action :require_login
  after_action :verify_authorized
  # after_action :verify_policy_scoped, only: %i(index)

  rescue_from Pundit::NotAuthorizedError, :with => :user_not_authorized

  private
  def require_login
    unless signed_in?
      flash.notice = "You need to be logged in"
    end
    super
  end

  def user_not_authorized
    redirect_to(root_path, alert: t("unauthorised_access")) and return
  end
end
