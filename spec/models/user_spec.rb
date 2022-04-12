require 'rails_helper'


RSpec.describe User, type: :model do
  
  it 'should create a user if all fields are provided' do
    @user = User.new(name: "Ryan MacEachern", email: "ryan@hotmail.com", password: "password", password_confirmation: "password")
    expect(@user).to be_truthy
  end

  context 'should have a unique email address' do
    it 'returns false for exact double email' do
      user = User.new(name: "Brian MacEachern", email: "ryan@hotmail.com", password: "password", password_confirmation: "password")
      expect(user).to_not be_valid
    end

    it 'returns false for case-insensitive double email' do
      User.new(name: "Ryan MacEachern", email: "ryan@hotmail.com").save
      user = User.new(name: "Brian MacEachern", email: "RYAN@hotmail.COM", password: "password", password_confirmation: "password")
      expect(user).to_not be_valid
    end
  end

  context 'should have matching password and password confirmation fields filled out.' do
    it 'returns false when missing password confirmation' do
      user = User.new(name: "Ryan", email: "ryan@hotmail.com", password: "password", password_confirmation: "")
      # puts "ERRORS: #{user.errors.inspect}"
      expect(user).to_not be_valid
    end
    it 'returns false when password and password confirmation do not match' do
      user = User.new(name: "Ryan", email: "example@hotmail.com", password: "password", password_confirmation: "wordpass")
      expect(user).to_not be_valid
    end
  end

  context 'should have a minimum password length of 8 characters' do
    it 'rejects a password that is too short' do
      user = User.new(name: "Ryan", email: "example@hotmail.com", password: "pass", password_confirmation: "pass")
      expect(user).to_not be_valid
    end
    it 'accepts a password of 8 characters' do
      user = User.new(name: "Ryan", email: "example@hotmail.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end
  end
  

end
