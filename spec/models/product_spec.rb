require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves successfully" do
      @category = Category.new(name: "Laptop")
      @product = Product.new(name: "hp", category_id: 1, quantity: 6, price: 900)
      expect(@product).to be_valid
    end
    it "validates that name is present" do
      @category = Category.new(name: "Laptop")
      @product = Product.new(name: nil, category_id: 1, quantity: 4, price: 1000)
      expect(@product[:name]).to be nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "validates that price is present" do
      @category = Category.new(name: "Laptop")
      @product = Product.new(name: "Dell", category_id: 1, quantity: 3, price: nil)
      @product.valid?
      expect(@product[:price]).to be nil
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "validates that quantity is present" do
      @category = Category.new(name: "Laptop")
      @product = Product.new(name: "hp", category_id: 1, quantity: nil, price: 900)
      @product.valid?
      expect(@product[:quantity]).to be nil
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "validates that category is present" do
      @category = Category.new(name: "Laptop")
      @product = Product.new(name: "Lenovo", category_id: nil, quantity: 2, price: 800)
      @product.valid?
      expect(@product[:category_id]).to be nil
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
