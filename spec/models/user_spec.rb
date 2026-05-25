require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  it "is valid with email, username, and password" do
    expect(user).to be_valid
  end

  it "requires an email" do
    user.email = nil

    expect(user).not_to be_valid
    expect(user.errors[:email]).to be_present
  end

  it "requires a username" do
    user.username = nil

    expect(user).not_to be_valid
    expect(user.errors[:username]).to be_present
  end

  it "requires a password" do
    user.password = nil

    expect(user).not_to be_valid
    expect(user.errors[:password]).to be_present
  end
end
