# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

puts 'All Users and Pages destroyed!'

4.times do |index|
  puts 'Create new User'

  u = User.new
  u.username              = "#{Faker::Internet.user_name}_#{index}"
  u.email                 = Faker::Internet.free_email
  u.password              = '177591'
  u.password_confirmation = '177591'

  if index == 0
    u.user_type = 'admin'
  else
    u.user_type = 'student'
  end

  u.save!

  puts 'new User created'

end

u = User.new
u.username              = 'pman89'
u.email                 = 'pman89@ya.ru'
u.password              = '177591'
u.password_confirmation = '177591'
u.user_type             = 'admin'
u.save!

puts 'new User (pman) created'