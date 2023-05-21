require 'rails_helper'

describe AuthService do
  let!(:user) {FactoryBot.create(:user, username: 'test', password: 'P@ssword1#')}
  describe '.encode' do
    it 'return token' do
      token = described_class.encode(user)
      decoded_token = JWT.decode(token, described_class::HMAC_SECRET, true, {alghorithm: described_class::ALGHORITHM_TYPE})
      expect(decoded_token).to eq(
        [
        {
          "id" => user.id,
          "username" => user.username
        },
        {"alg" => described_class::ALGHORITHM_TYPE}
        ]
      )
    end
  end
end
