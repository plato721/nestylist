# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if !Rails.env.production?
  User.create({
    username: 'honestabe',
    password: 'Password1'
  })
end

####################################
# SHOPS - places to buy things     #
####################################

Shop.create!(
  name: "Any",
  description: "Add your item to this shop if you want it to be seen on every shopping trip."
)
Shop.create!(name: "Wal Mart")
Shop.create!(name: "Costco")
