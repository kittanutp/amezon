class AuthController < ApplicationController
  def create
    user = User.find_by(username: params.require(:username))
    render json: {token: AuthService.call(user)}
  end
end
