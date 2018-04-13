require 'rails_helper'

RSpec.describe "UsersApi", type: :request do

  describe "POST #create" do

    let(:user_params) do
      {
        user: {
          full_name: "test test",
          email: "test@test.com",
          password: "123456"
        }
      }
    end

    it "creates a new user" do
      expect { post api_v1_users_path, params: user_params }.to change(User, :count).by(1)
      expect(response).to have_http_status(200)
    end
  end
end
