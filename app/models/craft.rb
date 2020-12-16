class Craft < ApplicationRecord

    has_many :project_crafts
	has_many :projects, through: :project_crafts

	has_many :supply_crafts
    has_many :supplies, through: :supply_crafts
    
end
