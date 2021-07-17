class Api::V1::UsersController < ApplicationController

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
      render json: {
        status: :success,
        message: "User created successfully"
    }
    else
      render json: user.errors.to_a[0]
    end
  end

  def destroy 
    user = User.find(params[:id])
    render json: "User account deleted" if user.destroy
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
