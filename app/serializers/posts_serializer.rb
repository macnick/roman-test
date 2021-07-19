class PostsSerializer
  def initialize(posts)
    @posts = posts
  end

  def as_json 
    posts.map do |post|
      {
        id: post.id,
        title: post.title,
        post_text: post.post_text,
        author: { id: post.user.id, name: "#{post.user.first_name} #{post.user.last_name}" }
      }
    end
  end

  private 

  attr_reader :posts
end