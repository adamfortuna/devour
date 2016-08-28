# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'adam@fortuna.name', password: 'letmein4', password_confirmation: 'letmein4')

Area.create!(name: 'Baldwin Park', public: true)
Area.create!(name: 'Winter Park', public: true)
Area.create!(name: 'Audoban Park', public: true)

Area.create!(name: 'Altamonte Springs', public: true)

Area.create!(name: 'All Disney', public: true)
Area.create!(name: 'Disney Resorts', public: true)
Area.create!(name: 'Disney Springs', public: true)
Area.create!(name: 'Magic Kingdom', public: true)
Area.create!(name: 'Epcot', public: true)
Area.create!(name: 'Animal Kingdom', public: true)

Area.create!(name: 'All Universal', public: true)
Area.create!(name: 'Universal CityWalk', public: true)
Area.create!(name: 'Islands of Adventure', public: true)
Area.create!(name: 'Universal Studios', public: true)
Area.create!(name: 'Universal Resorts', public: true)
