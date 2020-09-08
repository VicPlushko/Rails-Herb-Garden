class Remedy < ApplicationRecord
    belongs_to :user
    has_many :remedy_herbs
    has_many :herbs, through: :remedy_herbs
end
