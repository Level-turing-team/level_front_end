# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user_1 = User.create!(first_name: "Test", last_name: "Account", email: "something@example.com",username: "test-user", google_id: "123", zip: "12345",bio:"music is dope")
@user_2 = User.create!(first_name: "Other", last_name: "Account", email: "somethingelse@example.com",username: "test-user-2", google_id: "456", zip: "23456",bio:"i love music")
