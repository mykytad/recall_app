require 'rails_helper'

RSpec.describe "Home", type: :request do
  it "shows authentication links for guests" do
    get root_path

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Recall App")
    expect(response.body).to include("Sign in")
    expect(response.body).to include("Sign up")
  end

  it "shows the current username for signed-in users" do
    user = create(:user, username: "nikita")

    sign_in user
    get root_path

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Signed in as nikita")
    expect(response.body).to include("Sign out")
  end
end
