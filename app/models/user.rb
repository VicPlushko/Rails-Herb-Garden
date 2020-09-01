class User < ApplicationRecord
    has_many :herbs
    has_many :recipes
    has_secure_password
end
