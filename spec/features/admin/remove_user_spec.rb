require "rails_helper"

feature "Remove user" do
  background do
    FactoryGirl.create(:ironman)
  end

  given(:admin) { FactoryGirl.create(:admin) }

  scenario "successful deletion" do
    visit admin_users_path(as: admin)

    expect(page).to have_content("Tony Stark")
    expect(page).to have_content("Admin User")
    find(:xpath, "//tr[contains(.,'Tony Stark')]/td/a", :text => 'Remove').click
    expect(page).to have_content t("user.delete.success", user: "Tony Stark")
  end

  scenario "trying to delete yourself" do
    visit admin_users_path(as: admin)

    expect(page).to have_content("Tony Stark")
    expect(page).to have_content("Admin User")
    find(:xpath, "//tr[contains(.,'Admin User')]/td/a", :text => 'Remove').click
    expect(page).to have_content t("user.remove_self_attempt.failure")
    expect(page).to have_content("Admin User")
  end
end
