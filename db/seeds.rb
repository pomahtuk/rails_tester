# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  begin
    User.destroy_all
    Category.destroy_all
    Course.destroy_all
    Article.destroy_all
    Test.destroy_all
    Question.destroy_all
    Answer.destroy_all
  end
end

#Category.rebuild!

puts 'All Users and Categories destroyed!'

def create_couses(category)
  3.times do |index|
    puts 'Create new Course'

    cours                    = category.courses.new
    cours.title              = Faker::Lorem.paragraph 1
    cours.short              = Faker::Lorem.paragraph 3
    cours.full               = Faker::Lorem.paragraph 6

    cours.save!

    cours.send("to_#{[:draft, :published].sample}")
    
    create_article(cours)

    create_test(cours)

    puts 'new Course created'

  end
end

def create_article (course)
  3.times do
    puts 'Create new Article'

    article = course.articles.new
    article.title              = Faker::Lorem.paragraph 1
    article.short              = Faker::Lorem.paragraph 3
    article.full               = Faker::Lorem.paragraph 6
    article.picture            = URI.parse('http://lorempixel.com/400/200')

    article.save!  

    article.publish

    puts 'new Article created'
  end
end

def create_test (course)
  3.times do
    puts 'Create new Test'

    test                    = course.tests.new
    test.title              = Faker::Lorem.paragraph 1
    test.short              = Faker::Lorem.paragraph 3

    test.save!  

    test.send("to_#{[:draft, :published].sample}")

      5.times do

        question = test.questions.new

        question.title          = Faker::Lorem.paragraph 1
        question.question_type  = "#{[:single_choice, :multiple_choice, :open_gap].sample}"
        question.content        = Faker::Lorem.paragraph 2

        question.save!

        5.times do 

          answer = question.answers.new
          answer.title        = Faker::Lorem.paragraph 1
          answer.save!

        end

        if question.question_type == 'multiple_choice'
          question.answers.each do |answer|
            answer.update_attribute(:correct, [true, false].sample)
          end
        else
          question.answers.last.update_attribute(:correct, true)
        end

      end

    puts 'new Test created'
  end
end

['past', 'present', 'future'].each do |value|
  puts 'Create new category'

  category = Category.new
  category.name = value
  category.save!

  create_couses(category)

  ['simple', 'perfect', 'continious', 'perfect continious'].each do |other_value| 
    
    puts 'Create new subcategory'

    cat = Category.new
    cat.name     = other_value
    cat.save!

    cat.move_to_child_of category

    create_couses(cat)

  end

  puts 'new Category created'

end


4.times do |index|
  puts 'Create new User'

  u = User.new
  u.username              = "#{Faker::Internet.user_name}_#{index}"
  u.email                 = Faker::Internet.free_email
  u.password              = '177591'
  u.password_confirmation = '177591'

  if index == 0
    u.user_type = 'teacher'
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