require "rails_helper"

feature "New user registration" do
  given(:admin) { FactoryGirl.create(:admin) }

  scenario "successful sign up" do
    visit new_admin_user_path(as: admin)

    fill_form(:user, { first_name: "Tony", last_name: "Stark",
                       email: "tony@example.com", password: "password",
                       role: "Stockholder", active: true })
    click_on submit(:user)

    expect(page).to have_content t("user.create.success")
  end
end
