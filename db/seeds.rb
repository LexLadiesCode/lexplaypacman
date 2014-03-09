# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Seeding locations'
[
  {name: 'Arcadium', street_address: '574 N Limestone St', city: 'Lexington',
   postal_code: '40508', state: 'Kentucky', phone: '(859) 317-9712',
   website: 'http://www.arcadiumbar.com/', kid_friendly: false,
   latitude: 38.053789, longitude: -84.486492,
   hours: 'Mon - Thurs: 5:00pm - 1:00am, Friday: 4:00pm - 2:30am, ' +
          'Saturday: 2:00pm - 2:30am, Sunday: 1:00pm - 12:00am'},
  {name: 'Gattitown', street_address: '2524 Nicholasville Road',
   city: 'Lexington', state: 'Kentucky', postal_code: '40503',
   latitude: 38.00151133, longitude: -84.52004107, phone: '(859) 277-2323',
   website: 'http://www.gattitownlexington.com/',
   hours: 'Sunday-Thursday 11am – 9pm, Friday & Saturday 11am – 10pm'},
  {name: 'Tolly Ho', street_address: '606 South Broadway Road',
   city: 'Lexington', state: 'Kentucky', postal_code: '40508',
   latitude: 38.04355538, longitude: -84.50749718, phone: '(859) 253-2007',
   website: 'http://tollyho.com/', hours: '24 hours / 7 days a week'},
  {name: 'Taco Tico', street_address: '183 Boardwalk', city: 'Lexington',
   state: 'Kentucky', postal_code: '40511', latitude: 38.06976561,
   longitude: -84.483871, phone: '(859) 243-9940',
   website: 'https://www.facebook.com/TacoTicoLexington', hours: 'Mon - Sat: 10:30 am - 12:00 am, Sun: 10:30 am - 11:00 pm'},
  {name: "Charlie Brown's", street_address: '816 E Euclid Ave',
   city: 'Lexington', state: 'Kentucky', postal_code: '40502',
   latitude: 38.02986126 -84.49091667, phone: '(859) 269-5701',
   website: 'http://www.charliebrownslex.com/', hours: 'Monday thru Thursday - 11am to 1am, Friday & Saturday - 11am to 2am, Sunday - 12pm to 12am'},
  {name: 'Commonwealth Coin Laundry', street_address: '1503 Russell Cave Road',
   city: 'Lexington', state: 'Kentucky', postal_code: '40505',
   latitude: 38.07209747 -84.47553659, phone: '(859) 293-1415',
   website: 'http://www.commonwealthlaundromat.com/',
   hours: '7 Days A Week, 7am-11pm'}
].each do |data|
  puts "- #{data[:name]}"
  Location.create!(data)
end
