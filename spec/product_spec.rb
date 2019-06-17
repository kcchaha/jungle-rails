require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    # validation tests/examples here
    

    it "is not valid without a name" do
      category = Category.new(name: 'Food', description: 'delicious')
      product = category.products.new(
        name: nil,
        price: 20,
        quantity: 10,
      )
      expect(product).to be_invalid
    end

    it "is not valid without a price" do
      category = Category.new(name: 'Food', description: 'delicious')
      product = category.products.new(
        name: 'fries',
        price: nil,
        quantity: 20,
      )
      expect(product).to be_invalid
    end

    it "is not valid without a quantity" do
      category = Category.new(name: 'Food', description: 'delicious')
      product = category.products.new(
        name: 'soup',
        price: 90,
        quantity: nil,
      )
      expect(product).to be_invalid
    end

    it "is not valid without a category" do
      product = Product.new(
        name: 'noodle',
        price: 20,
        quantity: 80
      )
      expect(product).to be_invalid
    end
  end
end