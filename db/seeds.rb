# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.find_or_create_by(email: 'adam@fortuna.name').tap do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save
end


['Orlando', 'Baldwin Park', 'Winter Park', 'Audoban Park', 'Altamonte Springs', 'All Disney', 'Disney Resorts', 'Disney Springs', 'Magic Kingdom', 'Epcot', 'Animal Kingdom', 'All Universal', 'Universal CityWalk', 'Islands of Adventure', 'Universal Studios', 'Universal Resorts'].each do |a|
  Area.find_or_create_by(name: a).tap do |area|
    area.is_public = true
    area.save
  end

end

locations = [
  {
    name: 'Kappo',
    website: 'http://www.kappoeastend.com',
    review_url: 'http://forkful.net',
    price: 4,
    description: 'Kappo is a cool place.',
    rating: 5,
    areas: [Area.friendly.find('orlando'), Area.friendly.find('audoban-park'), Area.friendly.find('winter-park')],
    address: {
      street: '3201 Corrine Dr',
      city: 'Orlando',
      region: 'FL',
      postal_code: '32803',
      country: 'United States'
    }
  },
  {
    name: 'Seito Sushi',
    website: 'http://www.kappoeastend.com',
    review_url: 'http://forkful.net',
    price: 4,
    description: 'Seito has an awesome Omakase menu.',
    rating: 5,
    areas: [Area.friendly.find('orlando'), Area.friendly.find('baldwin-park'),Area.friendly.find('winter-park')],
    address: {
      street: '4898 New Broad St',
      city: 'Orlando',
      region: 'FL',
      postal_code: '32814',
      country: 'United States'
    }
  }
]


locations.each do |l|
  Location.find_or_initialize_by(name: l[:name]).tap do |location|
    location.website = l[:website]
    location.review_url = l[:review_url]
    location.price = l[:price]
    location.description = l[:description]
    location.rating = l[:rating]
    location.address = Address.create!(l[:address])
    location.areas = l[:areas]
    location.save
  end
end


sushi = Map.find_or_initialize_by(title: 'Best Sushi Restaurants in Orlando').tap do |map|
  map.short_title = 'Best Sushi'
  map.description = "Where can you get the best sushi in Orlando? Here are our top picks."

  map.location_maps = [
    LocationMap.new(location: Location.find_by(name: 'Kappo'), order: 1),
    LocationMap.new(location: Location.find_by(name: 'Seito Sushi'), order: 2)
  ]

  map.save
end
