class Remedy < ApplicationRecord
    belongs_to :user
    has_many :remedy_herbs, dependent: :destroy
    has_many :herbs, through: :remedy_herbs
    validates :title, :directions, presence: true
    validates :title, uniqueness: true
    accepts_nested_attributes_for :remedy_herbs, allow_destroy: true, reject_if: proc { |att| att['title'].blank? }
end
