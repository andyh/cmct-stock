require "rails_helper"

feature 'New user registration' do
  scenario 'successful sign up' do
    visit new_admin_user_path

    fill_form(:user, { first_name: "Tony", last_name: "Stark", email: "tony@example.com", password: "password", role: "Stockholder", active: true })
    click_on submit(:user)

    expect(page).to have_content t('user.create.success')
  end
end

