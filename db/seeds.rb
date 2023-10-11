# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Order.destroy_all
Item.destroy_all
User.destroy_all


p "Seeding..."

user1 = User.create!(
  email: 'seedtest@test.com',
  password: 'password56'
)

item1 = Item.create!(description: "A very good lager", price: 2.50)
item2 = Item.create!(description: "A very good stout", price: 3.50)
item3 = Item.create!(description: "A very good dark beer", price: 4.50)
item4 = Item.create!(description: "A very good IPA", price: 5.50)


order1 = Order.create!(user_id: user1.id, item_id: item1.id, quantity: 5, sub_total: item1.price * order1.quantity, shipping: 10, total: order1.sub_total + order1.shipping )
p "Seeds done, dude...."
