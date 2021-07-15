require 'rails_helper'

RSpec.describe Comment, type: :model do
    it "has no comments to begin with" do
      expect(Comment.count).to eq 0
    end
  
    it "has one post after creating one" do
      user = User.create
      post = Post.create(title: "Title", post_text: "Post text", user_id: user.id)
      Comment.create(comment_text: "Comment text", user_id: user.id, post_id: post.id)
      expect(Comment.count).to eq 1
    end
  end