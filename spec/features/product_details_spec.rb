require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario "They click to look at one product" do
    visit root_path
    sleep(2)
    click_on @category.products.first.name

    visit product_path(Product.first.id)

    #  DEBUG / VERIFY
    save_screenshot
    expect(page).to have_css '.dl-horizontal'
  end
end
