class Project < ApplicationRecord
    
    belongs_to :user
	has_many :project_crafts
	has_many :crafts, through: :project_crafts

	has_many :project_supplies
	has_many :supplies, through: :project_supplies

end
