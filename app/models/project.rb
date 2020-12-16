class Project < ApplicationRecord
    
    belongs_to :user
	has_many :project_crafts
	has_many :crafts, through: :project_crafts

	has_many :project_supplies
	has_many :supplies, through: :project_supplies

	def supplies_attributes=(supply_attributes)
		supply_attributes.values.each do |supply_attribute|
		  supply = Supply.find_or_create_by(supply_attribute)
		  
		  self.supplies << supply
		end
	end

end
