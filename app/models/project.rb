class Project < ApplicationRecord
    
    belongs_to :user
	has_many :crafts_projects
	has_many :crafts, through: :crafts_projects

	has_many :supplies, through: :crafts
	has_many :tools, through :crafts

	def supplies_attributes=(supply_attributes)
		supply_attributes.values.each do |supply_attribute|
		  supply = Supply.find_or_create_by(supply_attribute)
		  
		  self.supplies << supply
		end
	end

end
