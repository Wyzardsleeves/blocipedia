# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'random_data'
include RandomData

#Create users
5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

3.times do
  Wiki.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
wikis = WIki.all

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
