class Herb < ApplicationRecord
    has_many :remedy_herbs
    has_many :remedies, through: :remedy_herbs

end
