# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Article.destroy_all
User.destroy_all
Order.destroy_all
OrderArticle.destroy_all

p "Seeding..."

user1 = User.create!(
  email: 'seedtest@test.com',
  password: 'password56'
)

article1 = Article.create!(article_description: "A very good lager", price: 2.50, availability: 1, stock_qty: 5)
article2 = Article.create!(article_description: "A very good stout", price: 3.50, availability: 0, stock_qty: 4)
article3 = Article.create!(article_description: "A very good dark beer", price: 4.50, availability: 1, stock_qty: 3)
article4 = Article.create!(article_description: "A very good IPA", price: 5.50, availability: 0, stock_qty: 6)

p "Seeds done, dude...."
