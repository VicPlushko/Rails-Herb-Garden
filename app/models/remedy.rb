class Remedy < ApplicationRecord
    belongs_to :user
    has_many :remedy_herbs
    has_many :herbs, through: :remedy_herbs
    validates :title, :directions, presence: true
    validates :title, uniqueness: true
    accepts_nested_attributes_for :remedy_herbs
end
