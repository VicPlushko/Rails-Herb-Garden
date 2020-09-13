class User < ApplicationRecord
    has_many :remedies
    has_secure_password
    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
    accepts_nested_attributes_for :remedies


    def self.find_or_create_by_omniauth(auth_hash)
        self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
end
