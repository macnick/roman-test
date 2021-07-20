class StaticController < ApplicationController
  def index
    render json: { status: 'API is online' }
  end
end