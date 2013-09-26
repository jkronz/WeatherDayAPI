# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
WeatherLocale.create([
	{name: 'Atlanta, Georgia', link: '/q/zmw:30301.1.99999', time_zone: 'America/New_York'},
	{name: 'Chicago, Illinois', link: '/q/zmw:60290.1.99999', time_zone: 'America/Chicago'},
	{name: 'San Francisco, California', link: '/q/zmw:94101.1.99999', time_zone: 'America/Los_Angeles'}
])