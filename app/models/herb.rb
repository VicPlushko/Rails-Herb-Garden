class Herb < ApplicationRecord
    has_many :recipe_herbs
    has_many :recipes, through: :recipe_herbs
end
