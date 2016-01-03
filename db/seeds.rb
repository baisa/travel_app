# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

trips = Trip.create([{title: 'Norway', description: 'great outdoor trip'},
  {title: 'Korfu', description: 'easy sunny vacation'},
  {title: 'Switzerland', description: 'skiing in Laax resort'}
  ])

trips.each do |trip|
  trip.participants.create([{name: 'Suze'}, {name: 'Peter'}, {name: 'Ana'}, {name: 'John'}])
  trip.todos.create([{task: 'flight reservations'}, {task: 'change currency'}, {task: 'book a hotel'}])
  trip.costs.create([{title: 'transport', amount: 200.00}, {title: 'accomodation', amount: 350.00}, {title: 'food', amount: 530.00}])
  trip.places.create([{name: 'Oslo', latitude: 59.9500, longitude: 10.7500}, {name: 'Bergen', latitude: 60.3894, longitude: 5.3300},
    {name: 'Lillehammer', latitude: 61.1300, longitude: 10.4325}])
end
