# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def update_or_create_record model, key, data
  value = data[key]
  print "- #{value}"
  query = {key => value}
  record = model.where(query).first_or_initialize
  record.assign_attributes(data)
  is_new = record.new_record?
  record.save!
  if is_new
    puts ' (created)'
  else
    puts ' (updated)'
  end
end

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
   hours: '7 Days A Week, 7am-11pm'},
  {name: 'Cinemark Woodhill Movies 10', street_address: '425 Codell Drive',
   city: 'Lexington', state: 'Kentucky', postal_code: '40509',
   latitude: 38.02105517, longitude: -84.45199698, phone: '(859) 269-2207',
   website: 'http://www.cinemark.com/theatre-detail.aspx?node_id=1500'},
  {name: 'Kids Place at Lexington Athletic Club',
   street_address: '3882 Mall Road', city: 'Lexington', state: 'Kentucky',
   postal_code: '40503', latitude: 37.98334951, longitude: -84.53192566,
   phone: '(859) 273-3163', website: 'http://lexingtonathleticclub.com/',
   hours: 'Mon – Thur: 5:00am – 11:00pm, Friday: 5:00am – 9:00pm, ' +
          'Saturday: 7:00am – 7:00pm, Sunday: 8:00am – 8:00pm'},
  {name: 'Chevy Chase Coin Laundry', street_address: '315 South Ashland Avenue',
   city: 'Lexington', state: 'Kentucky', postal_code: '40502',
   latitude: 38.0310008, longitude: -84.49033973, phone: '(859) 266-5721',
   website: 'http://chevychasecoinlaundry.com/',
   hours: '7 days a week, 7:30am - 10pm'},
  {name: 'Office Lounge', street_address: '1533 Eastland Parkway #3',
   city: 'Lexington', state: 'Kentucky', postal_code: '40505',
   latitude: 38.04781866, longitude: -84.44977562, phone: '(859) 299-9943'},
  {name: "Chuck E. Cheese's", street_address: '1555 East New Circle Road',
   city: 'Lexington', state: 'Kentucky', postal_code: '40509',
   latitude: 38.01934133, longitude: -84.4557942, phone: '(859) 268-9000',
   website: 'http://www.chuckecheese.com/locations/get/963',
   hours: 'Sun-Thur 9am-10pm, Fri-Sat 9am-11pm'},
  {name: 'Pizza Hut', street_address: '3090 Richmond Road', city: 'Lexington',
   state: 'Kentucky', postal_code: '40509', latitude: 38.00333641,
   longitude: -84.44895661, phone: '(859) 266-1030',
   website: 'http://www.pizzahut.com/locations/kentucky/Lexington/014313',
   hours: 'Sun 12:00pm - 10:00pm, Mon 11:00am - 10:00pm, ' +
          'Tues 11:00am - 10:00pm, Weds 11:00am - 10:00pm, ' +
          'Thurs 11:00am - 10:00pm, Fri 11:00am - 10:00pm, ' +
          'Sat 11:00am - 10:00pm'},
  {name: 'Lexington Ice Center', street_address: '560 Eureka Springs Drive',
   city: 'Lexington', state: 'Kentucky', postal_code: '40517',
   latitude: 37.99758136, longitude: -84.45735525, phone: '(859) 269-5681',
   website: 'http://www.lexingtonicecenter.com'},
  {name: "Malibu Jack's Family FunCenter",
   street_address: '3025 Blake James Drive', city: 'Lexington',
   state: 'Kentucky', postal_code: '40509', latitude: 38.00818064,
   longitude: -84.43449497, phone: '(859) 687-0401',
   website: 'http://www.malibujacks.net',
   hours: 'Mon-Thu 3pm-9pm, Fri 3pm-11pm, Sat 11am-11pm, Sun noon-8pm'},
  {name: "CiCi's Pizza", street_address: '1315 Winchester Road',
   city: 'Lexington', state: 'Kentucky', postal_code: '40505',
   latitude: 38.04280311, longitude: -84.45815093, phone: '(859) 246-1116',
   website: 'http://www.cicispizza.com',
   hours: 'Monday - Thursday 11 am to 9 pm, Friday - Saturday 11 am to 9 pm, ' +
          'Sunday 11 am to 9 pm'},
  {name: 'Village Host', street_address: '431 Old Vine Street',
   city: 'Lexington', state: 'Kentucky', postal_code: '40507',
   latitude: 38.03920766, longitude: -84.49100658, phone: '(859) 455-3355',
   website: 'http://www.villagehostlex.com/',
   hours: 'Mon. – Thurs: 11:00 am – 10:00 pm, ' +
          'Fri and Sat: 11:00 am – 11:00 pm, Sun: 9:00 am-9:00 pm'},
  {name: 'Brannon Crossing Movie Theater', street_address: '150 Langly Drive',
   city: 'Nicholasville', state: 'Kentucky', postal_code: '40356',
   latitude: 37.95376809, longitude: -84.52900211, phone: '(859) 245-0460',
   website: 'http://www.amstarcinemas.com/location.asp?house_id=10002'},
  {name: 'Splash Em Out Coin Laundry & Wash-N-Fold',
   street_address: '3120 Pimlico Parkway', city: 'Lexington', state: 'Kentucky',
   postal_code: '40517', latitude: 37.9860997, longitude: -84.46067397,
   phone: '(859) 368-9786', website: 'https://www.facebook.com/SplashEmOut',
   hours: 'Mon - Sun: 7:00 am - 11:00 pm'}
].each do |data|
  update_or_create_record Location, :name, data
end

puts 'Seeding players'
[
  {email: 'cheshire137@gmail.com', twitter: 'cheshire137'},
  {email: 'kristen.hanny@gmail.com'}
].each do |data|
  data[:is_banned] = false
  update_or_create_record Player, :email, data
end
