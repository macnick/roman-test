class Api::V1::PostsController < ApplicationController
  MAX_PAGINATION_LIMIT = 5

  def index
    posts = Post.all.limit(limit).offset(params[:offset])
    render json: PostsSerializer.new(posts).as_json
  end

  def create
    user = User.create(user_params)
    post = Post.new(post_params)#.merge(user_id: user.id))
    if post.save
      render json: {
        status: :success,
        message: "Post created successfully",
        title: post.title
    }
    else
      render json: post.errors.to_a[0]
    end
  end

  private

  def post_params
    params.permit(:title, :post_text, :user_id)
  end

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end

  def limit
    [params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i, MAX_PAGINATION_LIMIT].min
  end
end