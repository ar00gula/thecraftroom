class Supply < ApplicationRecord
    
    has_many :crafts_supplies
	has_many :crafts, through: :crafts_supplies

	has_many :projects, through: :crafts


end
