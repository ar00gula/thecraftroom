class Craft < ApplicationRecord
    
    belongs_to :category

    has_many :crafts_projects
	has_many :projects, through: :crafts_projects

	has_many :crafts_supplies
    has_many :supplies, through: :crafts_supplies

    has_many :crafts_tools
    has_many :tools, through: :crafts_tools
    
end
