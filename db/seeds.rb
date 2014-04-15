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
  {name: 'Arcadium', slug: 'ARCAD', street_address: '574 N Limestone St', city: 'Lexington',
   postal_code: '40508', state: 'Kentucky', phone: '(859) 317-9712',
   website: 'http://www.arcadiumbar.com/', kid_friendly: false,
   latitude: 38.053789, longitude: -84.486492,
   hours: 'Monday - Thursday 5:00pm - 1:00am <br> Friday: 4:00pm - 2:30am ' +
          '<br> Saturday: 2:00pm - 2:30am <br> Sunday: 1:00pm - 12:00am'},
  {name: 'Gattitown', slug: 'GATTI', street_address: '2524 Nicholasville Road',
   city: 'Lexington', state: 'Kentucky', postal_code: '40503',
   latitude: 38.00151133, longitude: -84.52004107, phone: '(859) 277-2323',
   website: 'http://www.gattitownlexington.com/', kid_friendly: true,
   hours: 'Sunday - Thursday: 11am – 9pm <br> Friday & Saturday 11am – 10pm'},
  {name: 'Tolly Ho', slug: 'TOLLY', street_address: '606 South Broadway Road',
   city: 'Lexington', state: 'Kentucky', postal_code: '40508',
   latitude: 38.04355538, longitude: -84.50749718, phone: '(859) 253-2007',
   website: 'http://tollyho.com/', hours: '24 hours / 7 days a week', kid_friendly: true},
  {name: 'Taco Tico', slug: 'TACOT', street_address: '183 Boardwalk', city: 'Lexington',
   state: 'Kentucky', postal_code: '40511', latitude: 38.06976561,
   longitude: -84.483871, phone: '(859) 243-9940',
   website: 'https://www.facebook.com/TacoTicoLexington', hours: 'Monday - Saturday: 10:30 am - 12:00 am <br> Sunday: 10:30 am - 11:00 pm',
   kid_friendly: true },
  {name: "Charlie Brown's", slug: 'CHARLI', street_address: '816 E Euclid Ave',
   city: 'Lexington', state: 'Kentucky', postal_code: '40502',
   latitude: 38.02986126, longitude: -84.49091667, phone: '(859) 269-5701',
   website: 'http://www.charliebrownslex.com/', kid_friendly: true, hours: 'Monday - Thursday: 11:00 am - 1:00 am <br> Friday & Saturday: 11:00am - 2:00am <br> Sunday: 12:00pm to 12:00am'},
  {name: 'Commonwealth Coin Laundry', slug: 'COMMO', street_address: '1503 Russell Cave Road',
   city: 'Lexington', state: 'Kentucky', postal_code: '40505',
   latitude: 38.07209747, longitude: -84.47553659, phone: '(859) 293-1415',
   website: 'http://www.commonwealthlaundromat.com/', kid_friendly: true,
   hours: '7 Days A Week: 7:00am-11:00pm'},
  {name: 'Cinemark Woodhill Movies 10', slug: 'WOODH', street_address: '425 Codell Drive',
   city: 'Lexington', state: 'Kentucky', postal_code: '40509',
   latitude: 38.02105517, longitude: -84.45199698, phone: '(859) 269-2207',
   website: 'http://www.cinemark.com/theatre-detail.aspx?node_id=1500', kid_friendly: true},
  {name: 'Kids Place at Lexington Athletic Club', slug: 'KIDSP',
   street_address: '3882 Mall Road', city: 'Lexington', state: 'Kentucky',
   postal_code: '40503', latitude: 37.98334951, longitude: -84.53192566,
   phone: '(859) 273-3163', website: 'http://lexingtonathleticclub.com/', kid_friendly: true,
   hours: 'Monday – Thursday: 5:00am – 11:00pm <br> Friday: 5:00am – 9:00pm' +
          '<br> Saturday: 7:00am – 7:00pm <br> Sunday: 8:00am – 8:00pm'},
  {name: 'Chevy Chase Coin Laundry', slug: 'CHEVY', street_address: '315 South Ashland Avenue',
   city: 'Lexington', state: 'Kentucky', postal_code: '40502',
   latitude: 38.0310008, longitude: -84.49033973, phone: '(859) 266-5721',
   website: 'http://chevychasecoinlaundry.com/', kid_friendly: true,
   hours: '7 days a week: 7:30am - 10:00pm'},
  {name: 'Office Lounge', slug: 'OFFIC', street_address: '1533 Eastland Parkway #3',
   city: 'Lexington', state: 'Kentucky', postal_code: '40505', kid_friendly: false,
   latitude: 38.04781866, longitude: -84.44977562, phone: '(859) 299-9943'},
  {name: "Chuck E. Cheese's", slug: 'CHUCK', street_address: '1555 East New Circle Road',
   city: 'Lexington', state: 'Kentucky', postal_code: '40509', kid_friendly: true,
   latitude: 38.01934133, longitude: -84.4557942, phone: '(859) 268-9000',
   website: 'http://www.chuckecheese.com/locations/get/963',
   hours: 'Sunday - Thursday: 9:00am - 10:00pm <br> Friday - Saturday: 9:00am - 11:00pm'},
  {name: 'Pizza Hut', slug: 'PIZZA', street_address: '3090 Richmond Road', city: 'Lexington',
   state: 'Kentucky', postal_code: '40509', latitude: 38.00333641,
   longitude: -84.44895661, phone: '(859) 266-1030', kid_friendly: true,
   website: 'http://www.pizzahut.com/locations/kentucky/Lexington/014313',
   hours: 'Sunday: 12:00pm - 10:00pm <br> Monday - Saturday: 11:00am - 10:00pm,'},
  {name: 'Lexington Ice Center', slug: 'LEXICE', street_address: '560 Eureka Springs Drive',
   city: 'Lexington', state: 'Kentucky', postal_code: '40517',
   latitude: 37.99758136, longitude: -84.45735525, phone: '(859) 269-5681', kid_friendly: true,
   website: 'http://www.lexingtonicecenter.com'},
  {name: "Malibu Jack's Family FunCenter", slug: 'MALIB',
   street_address: '3025 Blake James Drive', city: 'Lexington',
   state: 'Kentucky', postal_code: '40509', latitude: 38.00818064,
   longitude: -84.43449497, phone: '(859) 687-0401', kid_friendly: true,
   website: 'http://www.malibujacks.net',
   hours: 'Monday - Thursday: 3:00pm - 9:00pm <br> Friday: 3:00pm - 11:00pm <br> Saturday: 11:00am - 11:00pm <br> Sunday: 12:00pm - 8:00pm'},
  {name: "CiCi's Pizza", slug: 'CICIS', street_address: '1315 Winchester Road',
   city: 'Lexington', state: 'Kentucky', postal_code: '40505',
   latitude: 38.04280311, longitude: -84.45815093, phone: '(859) 246-1116',
   website: 'http://www.cicispizza.com', kid_friendly: true,
   hours: 'Monday - Thursday: 11:00am - 9pm <br> Friday - Saturday: 11:00am - 9pm ' +
          '<br> Sunday: 11:00am to 9:00pm'},
  {name: 'Village Host', slug: 'VILLA', street_address: '431 Old Vine Street',
   city: 'Lexington', state: 'Kentucky', postal_code: '40507',
   latitude: 38.03920766, longitude: -84.49100658, phone: '(859) 455-3355',
   website: 'http://www.villagehostlex.com/', kid_friendly: true,
   hours: 'Monday – Thursday: 11:00am – 10:00pm <br>' +
          'Friday & Saturday: 11:00am – 11:00pm <br> Sunday: 9:00am - 9:00pm'},
  {name: 'Splash Em Out Coin Laundry & Wash-N-Fold', slug: 'SPLAS',
   street_address: '3120 Pimlico Parkway', city: 'Lexington', state: 'Kentucky',
   postal_code: '40517', latitude: 37.9860997, longitude: -84.46067397, kid_friendly: true,
   phone: '(859) 368-9786', website: 'https://www.facebook.com/SplashEmOut',
   hours: 'Monday - Sunday: 7:00am - 11:00pm'},
   {name: 'Lexington Public Library - Central Library', slug: 'LEXPUBLIB',
    street_address: '140 E Main Street', city: 'Lexington', state: 'Kentucky',
    postal_code: '40507', latitude: 38.045041, longitude: -84.496359, kid_friendly: true,
    phone: '(859) 231-5500', website: 'https://www.lexpublib.org',
    hours: 'Monday - Thursday: 9:00am - 9:00pm <br>
            Friday: 9:00am - 6:00pm <br>
            Saturday: 9:00am - 5:00pm <br>
            Sunday: 1:00pm - 5:00pm'  },
  {name: 'Cinemark Fayette Mall', slug: 'FAYET', street_address: '3800 Mall Road',
  city: 'Lexington', state: 'Kentucky', postal_code: '40503',
  latitude: 37.984408, longitude: -84.529924, phone: '(859) 971-0718',
  website: 'http://www.cinemark.com/theatre-detail.aspx?node_id=1608', kid_friendly: true}
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
