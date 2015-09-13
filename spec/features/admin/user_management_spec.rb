require "rails_helper"

feature "User Management" do
  given(:admin) { FactoryGirl.create(:admin) }
  given(:stockholder) { FactoryGirl.create(:user, :stockholder) }
  given(:manager) { FactoryGirl.create(:user, :manager) }

  scenario "admin user" do
    visit admin_users_path(as: admin)
    expect(current_path).to eq(admin_users_path)
    expect(page).to have_content t("admin.users.page_title")
  end

  scenario "stockholder user" do
    visit admin_users_path(as: stockholder)
    expect(current_path).to eq(root_path)
    expect(page).to have_content t("unauthorised_access")
  end

  scenario "manager user" do
    visit admin_users_path(as: manager)
    expect(current_path).to eq(root_path)
    expect(page).to have_content t("unauthorised_access")
  end
end

