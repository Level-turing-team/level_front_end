# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user_1 = User.create!(first_name: "Andrew", last_name: "Account", email: "something@example.com", username: "the painter man", google_id: "123", zip: "80301", bio:"music is dope")
@user_2 = User.create!(first_name: "Joe", last_name: "Account", email: "something2@example.com", username: "korn", google_id: "456", zip: "80305", bio:"i love music")
@user_3 = User.create!(first_name: "Kris", last_name: "Account", email: "something3@example.com", username: "slipknot", google_id: "789", zip: "80304", bio:"music is dope")
@user_4 = User.create!(first_name: "Jesus", last_name: "Account", email: "something4@example.com", username: "photos by jim", google_id: "910", zip: "80303", bio:"i love music")
@user_5 = User.create!(first_name: "Kyle", last_name: "Account", email: "something5@example.com", username: "arteest", google_id: "111", zip: "80544", bio:"music is dope")
