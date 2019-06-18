require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Click on 'add to cart' button and cart increases by 1" do
    visit root_path
    sleep(2)

    page.find('.products article:first-child .actions button').click
    save_screenshot
    expect(page).to have_content 'My Cart (1)'
  end
end
