# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

amber_house = House.create(address: "231 W 111th Street")
dana_house = House.create(address: "2115 Albemarle Road")

amber = Person.create(name: "Amber", house_id: amber_house.id)
dana = Person.create(name: "Dana", house_id: dana_house.id)
