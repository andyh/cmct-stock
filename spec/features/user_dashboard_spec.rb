require "rails_helper"

feature "Dashboard" do
  given(:user) { FactoryGirl.create(:user, :stockholder, first_name: "Steve", last_name: "Bloggs") }

  scenario "User with no stock or sales" do
    visit dashboard_path(as: user)
    expect(page).to have_content("Welcome Steve")
    expect(page).to have_content t("dashboard.index.no_stock")
    expect(page).to have_content t("dashboard.index.sales_info", value: 0)
    expect(page).to have_content t("dashboard.index.payment_info", value: 0)
  end
end
