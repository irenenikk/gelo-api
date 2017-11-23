class Player < ApplicationRecord
    has_secure_password

    after_create_commit :generate_token
    after_create_commit :initial_ratings

    validates :username, uniqueness: true

    def unconfirmed_games
        Game.where(white: self, confirmed: :false)
            .or(Game.where(black: self))
            .where.not(added_by: self)
    end

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
