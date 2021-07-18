require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  describe "GET /index" do
    it "return all users" do
      FactoryBot.create(:user, first_name: "Nick",
                              last_name: "Haras",
                              email: "dev1@nickharas.com",
                              password: "123456")
      FactoryBot.create(:user, first_name: "John",
                              last_name: "Doe",
                              email: "dev2@doe.com",
                              password: "123456")
      get "/api/v1/users"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end
  
  describe "POST /create user" do
    it "creates a new book" do
      expect {
        post "/api/v1/users", params: {first_name: "Jane",
                                        last_name: "Doe",
                                        email: "dev4@nickharas.com",
                                        password: "123456"
                                      }
      }.to change { User.count }.from(0).to(1)
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "DELETE /user/id" do
    it "deletes a user" do
      user = FactoryBot.create(:user, first_name: "Nick",
                              last_name: "Haras",
                              email: "dev1@nickharas.com",
                              password: "123456")
      expect {
        delete "/api/v1/users/#{user.id}"
      }.to change { User.count }.from(1).to(0)
      expect(response).to have_http_status(:success)
    end
  end

end
