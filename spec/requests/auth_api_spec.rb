require 'rails_helper'
require 'pry'

RSpec.describe "AuthsApi", type: :request do

  let! (:user) { User.create(full_name: "Jason Bourne", email: "jbourne@test.com", password: "123456") }
  let (:user_params) do
    {
      "user" => "jbourne@test.com",
      "password" => "123456"
    }
  end

  it 'creates new JWT token' do
    post '/api/v1/auth', params: user_params
    expect(response).to have_http_status(200)
  end
end
