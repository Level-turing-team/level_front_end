# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user_1 = User.create!(first_name: "Test", last_name: "Account", email: "something@example.com",username: "test-user", google_id: "123", zip: "12345",bio:"music is dope")
@user_2 = User.create!(first_name: "Other", last_name: "Account", email: "somethingelse@example.com",username: "test-user-2", google_id: "456", zip: "23456",bio:"i love music")

@user_3 = User.create!(id: 10000002, first_name: "Bob", last_name: "Jones", email: "somethingelse2@example.com",username: "test-user-24", google_id: "245234", zip: "80022", bio:"i love music and arts")
@user_4 = User.create!(id: 10000003, first_name: "Alexander", last_name: "Jones", email: "somethingelse3@example.com",username: "test-user-45", google_id: "245235", zip: "80023", bio:"Trying to connect with more artists")
@user_5 = User.create!(id: 10000004,first_name: "Sid", last_name: "Jones", email: "else@example.com",username: "test-user-457788", google_id: "44355676", zip: "80024", bio:"Photography is my passion")
@user_6 = User.create!(id: 10000005,first_name: "Simon", last_name: "Smith", email: "smith_else@example.com",username: "test-user-788", google_id: "12355676", zip: "80025", bio:"I love turtles")

