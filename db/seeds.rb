# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'admin@admin.com', password: 123123, name: 'Admin', role: 'admin')
User.create(email: 'felipe.andrada@gmail.com', password: 123123, name: 'Felipe Andrada', role: 'user', state_id: State.find_by_name('Goiás'), city_id: City.find_by_name('Goiânia'))