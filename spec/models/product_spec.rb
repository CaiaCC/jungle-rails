require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before do
      @category = Category.new(name: "Test")
    end

    it 'should save successfully given all four fields' do
      @product = Product.new(name: "Product for test1", price_cents: 20, quantity: 10, category: @category)

      
      expect(@product.save).to be true 
    end

    xit 'should gives error when the name field value is nil' do
      @product = Product.new(name: nil, price_cents: 20, quantity: 10, category: @category)
      @product.save

      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    xit 'should gives error when the price field value is nil' do
      @product = Product.new(name: "Product for test2", price_cents: nil, quantity: 10, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    xit 'should gives error when the quantity field value is nil' do
      @product = Product.new(name: "Product for test2", price_cents: 10, quantity: nil, category: @category)
      @product.save

      expect(@product.errors.full_messages.empty?).to be(false)
    end

    xit 'should gives error when the category field value is nil' do
      @product = Product.new(name: "Product for test3", price_cents: 10, quantity: nil, category: nil)
      @product.save

      expect(@product.errors.full_messages.empty?).to be(false)
    end
  end
end
