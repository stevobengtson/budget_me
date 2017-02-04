# frozen_string_literal: true
module Security
  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end

    def authenticated?(remember_digest, remember_token)
      return false if remember_digest.blank?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def find_and_authenticate_user(user_id, remember_token)
      user = User.find_by(id: user_id)
      return nil unless user.present?
      user if authenticated?(user.try(:remember_digest), remember_token)
    end
  end
end
