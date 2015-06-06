# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Message.destroy_all


Message.create!(channel_id:1, text:"some message about a bunch of shitty dog food. The sun is shinning but i am crying. Why is work so tedius? I want a burito. The mexican food at El Pelon is spectacular")

puts "Created 1 messgage"
