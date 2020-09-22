require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation" do

    it "should be create with 'password' and 'password_confirmation' fields" do
      @user = User.new(first_name: "Test-first", last_name: "Test-last", email: "test@email.com", password: nil, password_confirmation: nil)
      
      expect(@user.save).to be false
    end
    
    it "should have the same value for 'password' and 'password_confirmation' fields" do
      @user = User.new(first_name: "Test-first", last_name: "Test-last", email: "test@email.com", password: "12345", password_confirmation: "12345")

      expect(@user.password).to eq(@user.password_confirmation)
    end

    it "should not be saved if 'password' and 'password_confirmation' fields are not the same" do
      @user = User.new(first_name: "Test-first", last_name: "Test-last", email: "test@email.com", password: "123", password_confirmation: "12345")
      expect(@user.save).to be false
    end

    it "should input unique email" do
      @user = User.new(first_name: "Test-first", last_name: "Test-last", email: "test@email.com", password: "1234", password_confirmation: "1234" )
      @user.save
      @another = User.new(first_name: "Test-first2", last_name: "Test-last2", email: "TEST@EMAIL.COM", password: "12345", password_confirmation: "12345")
    
      expect(@another.save).to be false
    end

    it "should input at least 5 letters to email" do
      @user = User.new(first_name: "Test-first", last_name: "Test-last", email: "test", password: "1234", password_confirmation: "1234")
    
      expect(@user.save).to be false
    end
    
    it 'should require the first_name field' do
      @user = User.new(first_name: nil, last_name: "Test-last", email: "test@email.com", password: "12345", password_confirmation: "12345")

      expect(@user.save).to be false
    end

    it 'should require the last_name field' do
      @user = User.new(first_name: "Test-first", last_name: nil, email: "test@email.com", password: "12345", password_confirmation: "12345")

      expect(@user.save).to be false
    end

    it 'should require the email field' do
      @user = User.new(first_name: "Test-first", last_name: "Test-last", email: nil, password: "12345", password_confirmation: "12345")

      expect(@user.save).to be false
    end
  end

  
end
