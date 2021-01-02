class Craft < ApplicationRecord
    belongs_to :craft_category
    
    has_many :crafts_supplies
    has_many :supplies, through: :crafts_supplies

    validates :name, presence: true

    def supply_attributes=(supplies)
        self.supplies = SupplyCategory.find_or_create_by(name: supplies[:name])
        self.supplies.update(supplies)
    end

end
