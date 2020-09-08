class Herb < ApplicationRecord
    has_many :remedy_herbs
    has_many :remedies, through: :remedy_herbs
    validates :name, :latin_name, :family, :medicinal_parts, :taste, :energetics, :action, :ideal_for, :application, :dosage, :considerations, presence: true
    validates :name, :latin_name, uniqueness: true

end
