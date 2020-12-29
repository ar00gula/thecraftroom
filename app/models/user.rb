class User < ApplicationRecord
    has_secure_password
    has_many :supplies
    has_many :supply_categories, through: :supplies
    has_many :craft_categories, through: :supplies

end
