class RemedyHerb < ApplicationRecord
    belongs_to :herb
    belongs_to :remedy, optional: true
    validates :quantity, presence: true
end
