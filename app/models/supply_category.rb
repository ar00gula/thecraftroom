class SupplyCategory < ApplicationRecord
    has_many :supplies

    validates :name, presence: true

end
