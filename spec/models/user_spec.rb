require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    expect(User.new(name: "Example User", email: "user@example.com", password: "password", password_confirmation: "password")).to be_valid
  end

  it "should have a name" do
    expect(User.new(name: "", email: "user@example.com", password: "password", password_confirmation: "password")).to_not be_valid
  end

  it "should have an email" do
    expect(User.new(name: "Example User", email: "   ", password: "password", password_confirmation: "password")).to_not be_valid
  end

  it "should not have too long of a name" do
    expect(User.new(name: "a" * 51, email: "user@example.com", password: "password", password_confirmation: "password")).to_not be_valid
  end

  it "should not have too long of a email" do
    expect(User.new(name: "Example User", email: "a" * 244 + "@example.com", password: "password", password_confirmation: "password")).to_not be_valid
  end

  it "should have a valid email" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      expect(User.new(name: "Example User", email: valid_address, password: "password", password_confirmation: "password")).to be_valid
    end
  end

  it "should not have an invalid email" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      expect(User.new(name: "Example User", email: invalid_address)).to_not be_valid
    end
  end

  it "should have a unique email" do
    user = User.new(name: "Example User", email: "user@example.com")
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user).to_not be_valid
  end

  it "should save the email as lower case" do
    user = User.new(name: "Example User", email: "User@ExAMPle.CoM", password: "password", password_confirmation: "password")
    user.save
    user.email.should eq("user@example.com")
  end

  it "should have a password" do
    user = User.new(name: "Example User", email: "user@example.com", password: " " * 6, password_confirmation: " " * 6)
    expect(user).to_not be_valid
  end

  it "should have a password with at least 6 characters" do
    user = User.new(name: "Example User", email: "user@example.com", password: "a" * 5, password_confirmation: "a" * 5)
    expect(user).to_not be_valid
  end
end
