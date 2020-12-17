class Category < ApplicationRecord
    has_many :crafts
    has_many :supplies, through: :crafts
    has_many :tools, through: :crafts
end
