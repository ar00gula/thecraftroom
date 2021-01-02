class Supply < ApplicationRecord
    scope :in_stock, -> {where(in_stock: true)}

    belongs_to :supply_category
    belongs_to :user
    
    has_many :crafts_supplies
    has_many :crafts, through: :crafts_supplies
    has_many :craft_categories, through: :crafts

    validates :name, presence: true
    validates :in_stock, inclusion: [true, false]

    def supply_category_attributes=(supply_category)
        self.supply_category = SupplyCategory.find_or_create_by(name: supply_category[:name])
        self.supply_category.update(supply_category)
    end  
end
