require "rails_helper"

RSpec.describe DashboardController, type: :controller do
  describe "GET #index" do
    context "when user is logged in" do
      let!(:user) { FactoryGirl.create(:user) }

      before do
        sign_in_as(user)
        get :index
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :index }

    end

    context "when no user is logged in" do
      before do
        get :index
      end

      it { is_expected.to redirect_to sign_in_path }
      it { is_expected.to set_flash[:notice].to("You need to be logged in") }
      it { is_expected.to set_session[:return_to].to(dashboard_path) }
    end

  end
end
