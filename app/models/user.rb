class User < ApplicationRecord
    has_many :remedies
    has_secure_password
    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
end
