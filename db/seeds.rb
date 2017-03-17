require 'faker'

User.delete_all
Question.delete_all


users = 10.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end



questions = 13.times.map do
  Question.create!( :content => Faker::Hacker.say_something_smart + "?",
                    :user => User.all.sample
                    )
end

answers = 25.times.map do
  Answer.create!(:content => Faker::Hipster.paragraph,
                :user => User.all.sample,
                :question => Question.all.sample
                  )
end

comments_on_questions = 10.times.map do
  Comment.create!(:content => Faker::Hipster.sentence,
                  :user => User.all.sample,
                  :commentable => Question.all.sample
                  )
end

comments_on_answers = 16.times.map do
  Comment.create!(:content => Faker::Hipster.sentence,
                  :user => User.all.sample,
                  :commentable => Answer.all.sample
                  )
end
