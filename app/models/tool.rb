class Tool < ApplicationRecord

    has_many :crafts_tools
    has_many :crafts, through: :crafts_tools

    has_many :projects, through: :crafts
    
end
