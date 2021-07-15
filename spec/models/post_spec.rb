require 'rails_helper'

RSpec.describe Post, type: :model do
  it "has no posts to begin with" do
    expect(Post.count).to eq 0
  end

  it "can not create a post without a user" do
    Post.create(title: "Title", post_text: "Post text")
    expect(Post.count).to eq 0
  end

  it "has one post after creating one" do
    user = User.create(first_name: "Nick", last_name: "Haras", email: "dev@nickharas.com", password: "123456")
    Post.create(title: "Post Title", post_text: "This is the first post text", user_id: user.id)
    expect(Post.count).to eq 1
  end
end

