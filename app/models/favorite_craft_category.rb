class FavoriteCraftCategory < ApplicationRecord
    belongs_to :user
    belongs_to :craft_category
end
