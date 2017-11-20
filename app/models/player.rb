class Player < ApplicationRecord
    has_secure_password

    before_save :generate_token, on: [:create]
    before_save :initial_ratings, on: [:create]

    validates :username, uniqueness: true

    private
        def generate_token
            self.token = loop do
                random_token = SecureRandom.urlsafe_base64(nil, false)
                break random_token unless Player.exists?(token: random_token)
            end
        end

        def initial_ratings
            self.elo = 1500
            self.deviation = 350
            self.volatility = 0.06
        end
end