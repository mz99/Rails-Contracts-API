require 'rails_helper'
require 'pry'

RSpec.describe "ContractsApi", type: :request do
  def authenticated_header(user)
      contents = { :user_id => user.id, :expiration => 24.hours.from_now.to_i }
      token = JwtService.encode(contents)
      { 'Authorization': "Bearer #{token}" }
  end


  context "POST #create" do
    let (:user) { User.create(full_name: "Jason Bourne", email: "jbourne@test.com", password: "123456") }
    let (:contract_params) do
      {
        "contract[vendor]" => "Lebara",
        "contract[starts_on]" => "2018-12-12",
        "contract[ends_on]" => "2018-12-16",
        "contract[price]" => "15"
      }
    end
    before(:each) do
      allow(DecodeAuthenticationCommand).to receive_message_chain(:call, :result).and_return(user)
    end

    it 'creates a new contract' do
      expect { post api_v1_user_contracts_path(user), { params: contract_params} }.to change(Contract, :count).by(1)
      expect(response).to have_http_status(200)
    end

    it 'tries to create a new contract with incorrect params' do
      contract_params["contract[vendor]"] = nil
      expect { post api_v1_user_contracts_path(user), { params: contract_params} }.to change(Contract, :count).by(0)
      expect(response).to have_http_status(400)
    end
  end

  context "GET #show" do
    let (:user) { User.create(full_name: "Jason Bourne", email: "jbourne@test.com", password: "123456") }
    let (:user2) { User.create(full_name: "James Bond", email: "jbond@ukthebest.com", password: "123456") }
    let (:contract) { Contract.create(vendor: "Lebara", starts_on: "2018-12-12", ends_on: "2018-12-15", price: 15, user_id: user.id) }
    let (:contract2) { Contract.create(vendor: "Lebara", starts_on: "2018-12-12", ends_on: "2018-12-15", price: 15, user_id: user2.id) }

    it 'shows current user contracts' do
      get "/api/v1/users/#{user.id}/contracts/#{contract.id}", headers: authenticated_header(user)
      expect(response).to have_http_status(200)
    end

    it 'does not find the user contract when another user contract is specified' do
     get "/api/v1/users/#{user2.id}/contracts/#{contract2.id}", headers: authenticated_header(user)
     # expect(response).to include("Contract not found")
     expect(response).to have_http_status(400)
    end
  end

  context "DELETE #destroy" do
    let (:user) { User.create(full_name: "Jason Bourne", email: "jbourne@test.com", password: "123456") }
    let (:contract) { Contract.create(vendor: "Lebara", starts_on: "2018-12-12", ends_on: "2018-12-15", price: 15, user_id: user.id) }

    it 'deletes the user contract' do
      delete "/api/v1/users/#{user.id}/contracts/#{contract.id}", headers: authenticated_header(user)
      expect(response).to have_http_status(204)
    end
  end
end
