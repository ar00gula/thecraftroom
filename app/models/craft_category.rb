class CraftCategory < ApplicationRecord
    has_many :crafts
    has_many :favorite_craft_categories

    validates :name, presence: true
end
