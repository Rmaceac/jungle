require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'should create a user if all fields are provided' do
    @user = User.new(name: "Ryan MacEachern", email: "ryan@hotmail.com", password: "password", password_confirmation: "password")
    expect(@user).to be_truthy
  end

  context 'should have a unique email address' do
    it 'returns false for exact double email' do
      # @user
      user2 = User.new(name: "Brian MacEachern", email: "ryan@hotmail.com").save
      expect(user2).to eq(false)
    end

    it 'returns false for case-insensitive double email' do
      User.new(name: "Ryan MacEachern", email: "ryan@hotmail.com").save
      user2 = User.new(name: "Brian MacEachern", email: "RYAN@hotmail.COM").save
      expect(user2).to eq(false)
    end
  end

  context 'should have matching password and password confirmation fields filled out.' do
    it 'returns false when missing password confirmation' do
      user = User.new(name: "Ryan", email: "ryan@hotmail.com", password: "password", password_confirmation: "")
      # puts "ERRORS: #{user.errors.inspect}"
      expect(user).to_not be_valid
    end
    it 'returns false when password and password confirmation do not match' do
      user1 = User.new(name: "Ryan", email: "ryan@hotmail.com", password: "password", password_confirmation: "wordpass").save
      expect(user1).to eq(false)
    end
  end
  

end
