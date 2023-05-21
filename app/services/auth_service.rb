class AuthService
  HMAC_SECRET = 'my$ecretK3y'
  ALGHORITHM_TYPE = 'HS256'
  def self.encode(user)
    payload = {id: user.id, username: user.username}
    return JWT.encode(payload, HMAC_SECRET, ALGHORITHM_TYPE)
  end

    def self.decode(token)
      decoded_token = JWT.decode(token, HMAC_SECRET, true, {alghorithm: ALGHORITHM_TYPE})
      return decoded_token[0]["id"]
    end
end
