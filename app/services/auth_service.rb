class AuthService
  HMAC_SECRET = 'my$ecretK3y'
  ALGHORITHM_TYPE = 'HS256'
  def self.call(user)
    payload = {id: user.id, username: user.username}
    return JWT.encode(payload, HMAC_SECRET, ALGHORITHM_TYPE)
  end
end
