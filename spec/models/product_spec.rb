require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'should save successfully given all four fields' do
      @category = Category.new(name: "Test")
      @product = Product.new(name: "Product for test1", price_cents: 20, quantity: 10, category: @category)
      @product.save
      expect(@product.save).to be(true)  # be true -> ruby doesn't need ()?, why need to ckeck @product.save instead @product exist
      # expect(@product.save).to exist   -> why failed? isn't it check if the obj is exist?
      # expect(@product).to have_key(:category)  -> best practice for expect result
    end

    it 'should gives error when the name field value is nil' do
      @category = Category.new(name: "Test")
      @product = Product.new(name: nil, price_cents: 20, quantity: 10, category: @category)
      @product.save

      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it 'should gives error when the price field value is nil' do
      @category = Category.new(name: "Test")
      @product = Product.new(name: "Product for test2", price_cents: nil, quantity: 10, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should gives error when the quantity field value is nil' do
      @category = Category.new(name: "Test")
      @product = Product.new(name: "Product for test2", price_cents: 10, quantity: nil, category: @category)
      @product.save

      expect(@product.errors.full_messages.empty?).to be(false)
    end

    it 'should gives error when the category field value is nil' do
      @product = Product.new(name: "Product for test3", price_cents: 10, quantity: nil, category: nil)
      @product.save

      expect(@product.errors.full_messages.empty?).to be(false)
    end
  end
end
