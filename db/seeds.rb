# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ product_name: 'Chicago' }, { product_name: 'Copenhagen' }])
#   Mayor.create(product_name: 'Emanuel', city: cities.first)
# MediaPointProduct.create(media_point_id: '1', product_id: '1')
# MediaPointProduct.create(media_point_id: '1', product_id: '2')

## media point product join for heroku

# RecipientChannel.create([
# {recipient_id: 18698, channel_id: 1},
# {recipient_id: 18699, channel_id: 1}
# ])
#
#
# RecipientIndustry.create([
#   {recipient_id:5745 ,industry_id: 83},
# ])
#
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }