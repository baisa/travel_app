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
  trip.todos.create([{task: 'flight reservations'}, {task: 'change currency'}, {task: 'book a hotel'}])
  trips.costs.create([{title: 'transport', amount: '200.00'}, {title: 'accomodation', amount: '350.00'}, {title: 'food', amount: '530.00'}])
end

