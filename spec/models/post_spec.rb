require 'rails_helper'

RSpec.describe Post, type: :model do
  it "has no posts to begin with" do
    expect(Post.count).to eq 0
  end

  it "has one post after creating one" do
    user = User.create
    Post.create(title: "Title", post_text: "Post text", user_id: user.id)
    expect(Post.count).to eq 1
  end
end

