# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Mehta', email: 'mehta.punjasthitkul@dlinkcorp.com',
	password: 'mehta', password_confirmation: 'mehta', admin: true)

User.create(name: 'Zac', email: 'zachary.sloss@dlinkcorp.com',
	password: 'zac', password_confirmation: 'zac')

User.create(name: 'Dan', email: 'daniel.pan@dlinkcorp.com',
	password: 'dan', password_confirmation: 'dan')

User.create(name: 'Duncan', email: 'duncan.gibb@dlinkcorp.com',
	password: 'duncan', password_confirmation: 'duncan')

User.create(name: 'Patrick', email: 'patrick.white@dlinkcorp.com',
	password: 'patrick', password_confirmation: 'patrick')