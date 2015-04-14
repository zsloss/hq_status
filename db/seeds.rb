# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Admin', email: 'admin@admin.com',
	password: 'admin', password_confirmation: 'admin', admin: true)

User.create(name: 'User', email: 'user@user.com',
	password: 'user', password_confirmation: 'user')

User.create(name: 'Other', email: 'other@other.com',
	password: 'other', password_confirmation: 'other')