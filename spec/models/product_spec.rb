require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'should create a product if all of the validations are true' do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Googly eyes", price_cents: 1000, quantity: 100, :category => @category)
      @product.valid?
      expect(@product.errors).not_to include("can\'t be blank")
    end
    
    it 'should not create a product if the name is missing' do
      @category = Category.new(name: "Testing")
      @product = Product.new(price_cents: 1000, quantity: 100, :category => @category)
      @product.valid?
      expect(@product.errors[:name]).to include("can\'t be blank")
    end

    it 'should have a price' do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Googly eyes", quantity: 100, :category => @category)
      @product.valid?
      expect(@product.errors[:price_cents]).to include("is not a number")
    end

    it 'should have a quantity' do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Googly eyes", price_cents: 1000, :category => @category)
      @product.valid?
      expect(@product.errors[:quantity]).to include("can\'t be blank")
    end

    it 'should have a category' do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Googly eyes", price_cents: 1000, quantity: 100)
      @product.valid?
      expect(@product.errors).not_to include("can\'t be blank")
    end

  end

end
