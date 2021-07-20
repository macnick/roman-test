class PostSerializer
  def initialize(post)
    @post = post
  end

  def as_json 
    post.map do 
      {
        id: post.id,
        title: post.title,
        post_text: post.post_text,
        author: { id: post.user.id, name: "#{post.user.first_name} #{post.user.last_name}" }
      }
    end
  end

  private 

  attr_reader :post
end