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
    :color => "yellow",
    :description => "lionsbrand, cotton"
  },

  "blue yarn" => {
    :name => "yarn",
    :color => "blue",
    :description => "lionsbrand, cotton"
  },

  "sticks" => {
    :name => "sticks",
    :color => "brown",
    :description => "approx 30 smol sticks"
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

  supply_list ={

"paper crafts" => {
    :name => "paper crafts",
    :description => "envelopes, origami, cards, wrapping paper, etc"
  },

  "carpentry" => {
    :name => "carpentry",
    :description => "all my carp shit"
  },

  "home improvements" => {
    :name => "home improvements",
    :description => "shelves, "
  },

  "bookbinding" => {
    :name => "bookbinding",
    :description => "lionsbrand, cotton"
  },

  "knitting" => {
    :name => "knitting",
    :description => "lionsbrand, cotton"
  },

  "moss and bark" => {
    :name => "moss and bark",
    :description => "approx 30 smol sticks"
  }
}

craft_list.each do |name, supply_hash|
    s = Supply.new
    s.name = name
    supply_hash.each do |attribute, value|
      s[attribute] = value
    end
    s.save
  end