class UserController < ApplicationController
  def create
    user = User.create(username: params.require(:username))
    render json: user
  end
end
