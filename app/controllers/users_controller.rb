class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  rescue ActiveRecord::RecordNotFound
    render json: "There is no user with id: #{params[:id]}"
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: "User created successfully"
    else
      render json: "User can not be created"
    end
  end

  def destroy 
    user = User.find(params[:id])
    if user.destroy
      render json: "User account deleted"
    end
    rescue ActiveRecord::RecordNotFound
    render json: "There is no user with id: #{params[:id]}"
  end

  private

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end

end
