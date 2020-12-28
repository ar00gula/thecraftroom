class Supply < ApplicationRecord
    belongs_to :supply_category
    
    has_many :crafts_supplies
    has_many :crafts, through: :crafts_supplies


    def supply_category_attributes=(supply_category)
        self.supply_category = SupplyCategory.find_or_create_by(name: supply_category[:name])
        self.supply_category.update(supply_category)
    end  
end
