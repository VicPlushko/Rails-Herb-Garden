class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_herbs
    has_many :herbs, through: :recipe_herbs
end
