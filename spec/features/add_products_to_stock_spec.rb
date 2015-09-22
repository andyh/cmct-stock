require "rails_helper"

feature "Add Products to Stock" do
  given(:user) { FactoryGirl.create(:user, :stockholder) }

  background do
    FactoryGirl.create(:product, name: "Tea-towel", price: 5)
    FactoryGirl.create(:product, name: "Scarf", price: 15)
    FactoryGirl.create(:product, name: "T-Shirt", price: 7)
    FactoryGirl.create(:product, name: "Bookmark", price: 2)
  end

  scenario "with no existing stock" do
    visit dashboard_path(as: user)
    expect(page).to have_content("You are currently holding no stock")
    visit new_stock_path(as: user)
    fill_form(:stock, {product_id: x, quantity: 3},)

    # fill stock take form
    # submit form
    # return to dashboard page
    # expect stock figures
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("You are currently holding £x worth of stock")
  end
end
