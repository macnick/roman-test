require 'rails_helper'

RSpec.describe "Users", type: :request do
  before :all do 
    @user = User.create(first_name: "Nick",
                        last_name: "Haras",
                        email: "dev@nickharas.com",
                        password: "123456")
  end

  describe "GET /index" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:success)
    end
  end

  # describe "POST /create" do
  #   it "returns http success" do
  #     get "/users/#{@user.id}"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET /destroy" do
    it "returns http success" do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:success)
    end
  end

end
