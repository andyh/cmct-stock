require "rails_helper"

RSpec.describe StockController, type: :controller do

  it { is_expected.to route(:get, "/stock").to(action: :index) }
  it { is_expected.to route(:get, "/stock/new").to(action: :new) }
  it { is_expected.to route(:post, "/stock").to(action: :create) }

  describe "GET #new" do
    context "when user is logged in" do
      let!(:user) { FactoryGirl.create(:user) }

      before do
        sign_in_as(user)
        get :new
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :new }
      it "assigns new stock as @stock" do
        expect(assigns(:stock)).to be_a_new(Stock)
      end

    end

    context "when no user is logged in" do
      before do
        get :new
      end

      it { is_expected.to redirect_to sign_in_path }
      it { is_expected.to set_flash[:notice].to("You need to be logged in") }
      it { is_expected.to set_session[:return_to].to(new_stock_path) }
    end

  end

end
