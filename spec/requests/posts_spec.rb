require 'rails_helper'

RSpec.describe "Posts", type: :request do

  let(:user) { FactoryBot.create(:user, first_name: "Nick",
                last_name: "Haras",
                email: "dev1@nickharas.com",
                password: "123456"
                )
  }

  describe "GET /index" do
    before do
      FactoryBot.create(:post, title: "Test post 1",
                              post_text: "This is the first test post text for testing",
                              user_id: user.id
      )
      FactoryBot.create(:post, title: "Test post 2",
                              post_text: "This is the second test post text for testing",
                              user_id: user.id
      )
    end
      

    it "return all posts" do
      get "/api/v1/posts"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it "returns a subset of posts based on limit" do
      get "/api/v1/posts", params: { limit: 1 }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
      expect(JSON.parse(response.body)).to eq(
        [
          {
            "id" => 1,
            "title" => "Test post 1",
            "post_text" => "This is the first test post text for testing",
            "author" => {
              "id" => 1,
              "name" => "Nick Haras"
            },
            "comments" => []
          }
        ]
      )
    end

    it "returns a subset of posts based on limit and offset" do
      get "/api/v1/posts", params: { limit: 1, offset: 1 }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
      expect(JSON.parse(response.body)).to eq(
        [
          {
            "id" => 2,
            "title" => "Test post 2",
            "post_text" => "This is the second test post text for testing",
            "author" => {
              "id" => 1,
              "name" => "Nick Haras"
            },
            "comments" => []
          }
        ]
      )
    end
  end

  describe "POST /create post" do
    it "creates a new post" do
      expect {
        post "/api/v1/posts", params: {
            title: "Test post 3",
            post_text: "This is a test post text for testing",
            user_id: user.id
        }
      }.to change { Post.count }.from(0).to(1)
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
        "status" => "success",
        "message" => "Post created successfully",
        "title" => "Test post 3"
    })
    end
  end

end