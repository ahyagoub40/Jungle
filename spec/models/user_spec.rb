require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "password is bigger than 3 chars" do
      @user = User.create(password: "La", password_confirmation: "La")
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
      
    end
    it "passwords are not matching" do
      @user = User.create(password: "Laptop", password_confirmation: "Mac")
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "saves successfully" do
      @user = User.create(name: "Ahmed", email: "ahmed@ahmed.com", password: "Laptop", password_confirmation: "Laptop")
      expect(@user).to be_valid
    end
    it "validates that name is present" do
      @user = User.create(name: nil, email: "ahmed@ahmed.com", password: "Laptop", password_confirmation: "Laptop")
      puts "#{@user.errors.full_messages}"
      expect(@user[:name]).to eq(nil)
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "validates that email is present" do
      @user = User.create(name: "Ahmed", email: nil, password: "Laptop", password_confirmation: "Laptop")
      expect(@user[:email]).to eq(nil)
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "validates that password is present" do
      @user = User.create(name: "Ahmed", email: "ahmed@ahmed.com", password: nil, password_confirmation: "Laptop")
      expect(@user[:password]).to eq(nil)
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
 
    it "validates that password_confirmation is present" do
      @user = User.create(name: "Ahmed", email: "ahmed@ahmed.com", password: "Laptop", password_confirmation: nil)
      expect(@user[:password_confirmation]).to eq(nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
  end
  
end

describe '.authenticate_with_credentials' do
  before(:each) do
    @takenEmail = User.create(:email => 'testG@test.com', :password => 'password', :password_confirmation => 'password')
  end
  it 'should respond with email is not unique error' do
    @user = User.create(:email => 'testG@test.com', :password => 'password', :password_confirmation => 'password')
    p @user.errors.full_messages
    expect(@user.errors.full_messages).to include("Email has already been taken")
  end
end
