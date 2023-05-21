class AuthController < ApplicationController
  def create
    user = User.find_by(username: params.require(:username))
    if user.authenticate(params.require(:password))
      x = AuthService.encode(user)
      render json: {token: AuthService.encode(user)}
    else
      render json: {message: "Unauthorized"}, status: 401
    end
  end
end
