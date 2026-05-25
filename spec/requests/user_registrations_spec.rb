require 'rails_helper'

RSpec.describe "User registrations", type: :request do
  it "creates a user with email, username, and password" do
    expect do
      post user_registration_path, params: {
        user: {
          email: "new_user@example.com",
          username: "new_user",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end.to change(User, :count).by(1)

    user = User.last
    expect(user.email).to eq("new_user@example.com")
    expect(user.username).to eq("new_user")
  end

  it "does not create a user without a username" do
    expect do
      post user_registration_path, params: {
        user: {
          email: "no_username@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end.not_to change(User, :count)

    expect(response.status).to eq(422)
    expect(response.body).to include("Username")
  end
end
