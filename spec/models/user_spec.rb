require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation" do

    it "should be create with 'password' and 'password_confirmation' fields" do
      @user = User.new(first_name: "First", last_name: "Last", email: "test@email.com", password: nil, password_confirmation: nil)
      
      expect(@user.save).to be false
    end
    
    it "should have the same value for 'password' and 'password_confirmation' fields" do
      @user = User.new(first_name: "First", last_name: "Last", email: "test@email.com", password: "12345", password_confirmation: "12345")

      expect(@user.password).to eq(@user.password_confirmation)
    end

    it "should not be saved if 'password' and 'password_confirmation' fields are not the same" do
      @user = User.new(first_name: "First", last_name: "Last", email: "test@email.com", password: "123456", password_confirmation: "12345")
      expect(@user.save).to be false
    end

    it "should input unique email" do
      @user = User.new(first_name: "First", last_name: "Last", email: "test@email.com", password: "123456", password_confirmation: "123456" )
      @user.save
      @another = User.new(first_name: "Second", last_name: "Last", email: "TEST@EMAIL.COM", password: "12345", password_confirmation: "12345")
    
      expect(@another.save).to be false
    end

    it "should input at least 5 letters to password" do
      @user = User.new(first_name: "First", last_name: "Last", email: "test@email.com", password: "1234", password_confirmation: "1234")
    
      expect(@user.save).to be false
    end
    
    it 'should require the first_name field' do
      @user = User.new(first_name: nil, last_name: "Last", email: "test@email.com", password: "12345", password_confirmation: "12345")

      expect(@user.save).to be false
    end

    it 'should require the last_name field' do
      @user = User.create(first_name: "First", last_name: nil, email: "test@email.com", password: "12345", password_confirmation: "12345")

      expect(@user.save).to be false
    end

    it 'should require the email field' do
      @user = User.create(first_name: "First", last_name: "Last", email: nil, password: "12345", password_confirmation: "12345")

      expect(@user.save).to be false
    end
  end

  describe '.authenticate_with_credentials' do

    it 'should return user if email and password are authenticated' do
      @user = User.create(first_name: "First", last_name: "Last", email: "email@email.com", password: "12345", password_confirmation: "12345")
      @authenticated_user = User.authenticate_with_credentials("email@email.com", "12345")
      
      expect(@user).to eq(@authenticated_user)
    end

    it 'should return nil if email and password are not authenticated' do
      @user = User.create(first_name: "First", last_name: "Last", email: "test@email.com", password: "123", password_confirmation: "123")
      @authenticated_user = User.authenticate_with_credentials(@user.email, "123")
      expect(@authenticated_user).to be nil
    end

    it "should be authenticated successfully if a visitor types in a few spaces before and/or after their email address" do
      @user = User.create(first_name: "First", last_name: "Last", email: "test@email.com", password: "12345", password_confirmation: "12345")
      @authenticated_user = User.authenticate_with_credentials("  test@email.com ", "12345")
      expect(@user).to eq(@authenticated_user)
    end

    it "should be authenticated successfully if a visitor types mixed cases their email address" do
      @user = User.create(first_name: "First", last_name: "Last", email: "test@email.com", password: "12345", password_confirmation: "12345")
      @authenticated_user = User.authenticate_with_credentials("tEst@eMail.com", "12345")
      expect(@user).to eq(@authenticated_user)
    end
  end
    
end
