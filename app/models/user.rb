class User < ApplicationRecord
    has_many :remedies
    has_secure_password
    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
    accepts_nested_attributes_for :remedies


    def self.find_or_create_by_omniauth(auth_hash)
        # binding.pry
        self.where(uid: auth_hash["uid"]).first_or_create do |user|
            user.name = auth_hash[:info][:name]
            if auth_hash[:info][:email]
                user.email
            else
                user.email = SecureRandom.hex
            end
            
            user.password = SecureRandom.hex
        end
    end
end
