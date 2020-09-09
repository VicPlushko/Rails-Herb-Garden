class RemedyHerb < ApplicationRecord
    belongs_to :herb
    belongs_to :remedy, optional: true
end
