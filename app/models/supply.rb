class Supply < ApplicationRecord
    belongs_to :supply_category
    
    has_many :crafts_supplies
    has_many :crafts, through: :crafts_supplies
end
