# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
User.create!(
  email: "test3Standard@yahoo.com",
  password: "helloworld",
  role: "standard"
)

User.create!(
  email: "testPremium@yahoo.com",
  password: "helloworld",
  role: "premium"
)

User.create!(
  email: "testAdmin@yahoo.com",
  password: "helloworld",
  role: "admin"
)
=end
#Faker Test
User.create!(
  email: Faker::Internet.free_email('testDudette'),
  password: "helloworld",
  role: "standard"
)

Wiki.create!(
    title: Faker::Name.name,
    body:  Faker::Address.city
  )


=begin
#create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

#create a moderator
moderator = User.create!(
  name:     'Mod User',
  email:    'moderator@examle.com',
  password: 'helloworld',
  role:     'moderator'
)

#create a member
member = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld',
)
=end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} topics created"

#puts "#{Question.count} questions created"
