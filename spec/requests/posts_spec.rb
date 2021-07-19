require 'rails_helper'

RSpec.describe "Posts", type: :request do

  before do
    @user = FactoryBot.create(:user, first_name: "Nick",
    last_name: "Haras",
    email: "dev1@nickharas.com",
    password: "123456")
  end

  describe "GET /index" do
    it "return all posts" do
      FactoryBot.create(:post, title: "Test post 1",
                              post_text: "This is the first test post text for testing",
                              user_id: @user.id
      )
      FactoryBot.create(:post, title: "Test post 2",
                              post_text: "This is the second test post text for testing",
                              user_id: @user.id
      )
      get "/api/v1/posts"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "POST /create post" do
    it "creates a new post" do
      expect {
        post "/api/v1/posts", params: {
            title: "Test post 3",
            post_text: "This is a test post text for testing",
            user_id: @user.id
        }
      }.to change { Post.count }.from(0).to(1)
      expect(response).to have_http_status(:success)
    end
  end

end