# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

CSV.foreach('db/place.csv') do |row|
  Place.create(:name => row[0], :img => row[1], :altitude => row[2], :description => row[3], :areaid => row[4], :ruby => row[5], :hyakumeizan => row[6])
end

CSV.foreach('db/area.csv') do |row|
  Area.create(:name => row[0], :img => row[1], :description => row[2])
end
