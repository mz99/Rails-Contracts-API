require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
     @user = User.create(full_name: "John Tanner", email: "j@t.com", password: "123456")
  end

  it "is valid with a full name, email and password" do
    expect(@user).to be_valid
  end

  it "is invalid without a full name" do
    @user.full_name = nil
    @user.valid?
    expect(@user.errors[:full_name]).to include("can't be blank")
  end

  it "is invalid without an email" do
    @user.email = nil
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with an invalid email" do
    @user.email =  "test.test.com"
    @user.valid?
    expect(@user.errors[:email]).to include("is invalid")
  end

  it "is invalid with a duplicate email" do
    @user2 = User.new(full_name: "test", email: "j@t.com", password: "123465")
    @user2.valid?
    expect(@user2.errors[:email]).to include("has already been taken")
  end

  it "is invalid without a password" do
    @user.password = nil
    @user.valid?
    expect(@user.errors[:password]).to include("can't be blank")
  end
end
