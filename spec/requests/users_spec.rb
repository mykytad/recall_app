# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/:id' do
    it 'shows the requested user' do
      user = create(:user, username: 'nikita', email: 'nikita@example.com')

      get user_path(user)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('nikita')
      expect(response.body).to include('nikita@example.com')
    end
  end
end
