class Supply < ApplicationRecord
    
    has_many :supply_crafts
	has_many :crafts, through: :supply_crafts

	has_many :project_supplies
	has_many :projects, through: :project_supplies

end
