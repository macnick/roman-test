require 'rails_helper'

RSpec.describe Comment, type: :model do
    it "has no comments to begin with" do
      expect(Comment.count).to eq 0
    end
  
    it "can not create comments without a post or user" do
      Comment.create(comment_text: "Comment text")
      expect(Comment.count).to eq 0
    end

    it "has one post after creating one" do
      user = User.create(first_name: "Nick", last_name: "Haras", email: "dev@nickharas.com", password: "123456")
      post = Post.create(title: "Post Title", post_text: "This is the first post text", user_id: user.id)
      Comment.create(comment_text: "Comment text", user_id: user.id, post_id: post.id)
      expect(Comment.count).to eq 1
    end
  end