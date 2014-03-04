# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Seeding locations'
puts '- Arcadium'
Location.create!(name: 'Arcadium',
                 street_address: '574 N Limestone St',
                 city: 'Lexington',
                 postal_code: '40508',
                 state: 'Kentucky',
                 phone: '(859) 317-9712',
                 website: 'http://www.arcadiumbar.com/',
                 kid_friendly: false,
                 latitude: 38.053789,
                 longitude: -84.486492,
                 hours: 'Mon - Thurs: 5:00pm - 1:00am, Friday: 4:00pm - 2:30am, Saturday: 2:00pm - 2:30am, Sunday: 1:00pm - 12:00am')
