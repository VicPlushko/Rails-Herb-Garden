class RecipeHerb < ApplicationRecord
    belongs_to :herb
    belongs_to :recipe
end
