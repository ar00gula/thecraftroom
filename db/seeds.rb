# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# supply_list ={

#   "yarn" => {
#     :name => "Yarn",
#     :notes => "lionsbrand, cotton",
#     :count => 5
#   },

#   "blue yarn" => {
#     :name => "Yarn",
#     :notes => "lionsbrand, cotton"
#   },

#   "sticks" => {
#     :name => "sticks",
#     :notes => "approx 30 smol sticks"
#   }
# }

# supply_list.each do |name, supply_hash|
#     s = Supply.new
#     s.name = name
#     supply_hash.each do |attribute, value|
#       s[attribute] = value
#     end
#     s.save
#   end

craft_category_list ={

  "paper crafts" => {
    :name => "Paper Crafts",
    :notes => "envelopes, origami, cards, wrapping paper, etc"
  },

  "carpentry" => {
    :name => "Carpentry",
    :notes => "all my carp shit"
  },

  "home improvements" => {
    :name => "Home Improvements",
    :notes => "home stuff"
  },

  "decorative objects" => {
    :name => "Decorative Objects",
    :notes => "table centerpieces, cute things, etc"
  }
}

craft_category_list.each do |name, craft_category_hash|
    cc = CraftCategory.new
    cc.name = name
   craft_category_hash.each do |attribute, value|
      cc[attribute] = value
    end
    cc.save
  end


supply_category_list ={

  "fasteners" => {
    :name => "Fasteners",
    :notes => "glue, tape, etc"
  },

  "findings" => {
    :name => "Findings",
    :notes => "glitter, buttons, stickers, etc"
  },

  "sealants" => {
    :name => "Sealants",
    :notes => "mod podge, polyurethane, etc"
  },

  "fabric" => {
    :name => "Fabric",
    :notes => "this one's self explanitory"
  },

  "natural materials" => {
    :name => "Natural Materials",
    :notes => "moss, bark, sticks, etc"
  },

  "create new" => {
    :name => "Create New",
    :notes => "Create a new supply category!"
  }
}

supply_category_list.each do |name, supply_category_hash|
  sc = SupplyCategory.new
  sc.name = name
 supply_category_hash.each do |attribute, value|
    sc[attribute] = value
  end
  sc.save
end