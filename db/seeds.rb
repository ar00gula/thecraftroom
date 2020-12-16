# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

supply_list ={

"yellow yarn" => {
    :name => "yarn",
    :color => "yellow"
    :description => "lionsbrand, cotton",
  },

  "blue yarn" => {
    :name => "yarn",
    :color => "blue"
    :description => "lionsbrand, cotton",
  },

  "sticks" => {
    :name => "sticks",
    :color => "brown"
    :description => "approx 30 smol sticks",
  }
}

supply_list.each do |name, supply_hash|
    s = Supply.new
    s.name = name
    supply_hash.each do |attribute, value|
      s[attribute] = value
    end
    s.save
  end