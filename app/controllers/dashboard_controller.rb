class DashboardController < AuthenticatedController

  def index
    authorize :dashboard, :show?
  end
end
