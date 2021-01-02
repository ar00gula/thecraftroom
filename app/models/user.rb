class User < ApplicationRecord

    has_secure_password
    has_many :supplies
    has_many :supply_categories, through: :supplies
    has_many :favorite_craft_categories
    has_many :craft_categories, through: :favorite_craft_categories


    validates :username, { uniqueness: true, length: { in: 5..20} } 
    validates :password, { length: { minimum: 5}, confirmation: { case_sensitive: true} }
    #add must have both caps and noncaps, do this by verifying password and password.capitalize are not the same
end
