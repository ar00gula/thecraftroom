class Craft < ApplicationRecord
    belongs_to :craft_category
    
    has_many :crafts_supplies
    has_many :supplies, through: :crafts_supplies
end
