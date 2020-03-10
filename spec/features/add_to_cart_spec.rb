require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @product = @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "Navigate from the home page to the product detail page" do
    visit root_path
    expect(page).to have_content("My Cart (0)")
    save_screenshot
    click_button("Add", :match => :prefer_exact)
    # commented out b/c it's for debugging only
    # save_and_open_screenshot
    
    save_screenshot
    expect(page).to have_content("My Cart (1)")
  end
end