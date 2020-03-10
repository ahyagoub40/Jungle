require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "passwords are matching" do
      @user = User.new(password: "Laptop", password_confirmation: "Laptop")
      expect(@user[:password]).to eq(@user[:password_confirmation])
    end
    it "password is bigger than 4 chars" do
      @user = User.new(password: "Laptop", password_confirmation: "Laptop")
      expect(@user[:password].length).to be >= 4
    end
    it "passwords are not matching" do
      @user = User.new(password: "Laptop", password_confirmation: "Mac")
      expect(@user[:password]).to eq(@user[:password_confirmation])
    end

    it "saves successfully" do
      @user = User.new(name: "Ahmed", email: "ahmed@ahmed.com", password: "Laptop", password_confirmation: "Laptop")
      expect(@user).to be_valid
    end
    it "validates that name is present" do
      @user = User.new(name: nil, email: "ahmed@ahmed.com", password: "Laptop", password_confirmation: "Laptop")
      expect(@user[:name]).to be nil
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "validates that email is present" do
      @user = User.new(name: "Ahmed", email: nil, password: "Laptop", password_confirmation: "Laptop")
      expect(@user[:email]).to be nil
      expect(@product.errors.full_messages).to include("Email can't be blank")
    end
    it "validates that password is present" do
      @user = User.new(name: "Ahmed", email: nil, password: nil, password_confirmation: "Laptop")
      expect(@user[:password]).to be nil
      expect(@product.errors.full_messages).to include("password can't be blank")
    end
    it "validates that password_confirmation is present" do
      @user = User.new(name: "Ahmed", email: "ahmed@ahmed.com", password: "Laptop", password_confirmation: nil)
      expect(@user[:password_confirmation]).to be nil
      expect(@product.errors.full_messages).to include("password_confirmation can't be blank")
    end
  end
end
