require 'faker'

10.times do
  Post.create :title    => Faker::Lorem.sentence,
              :url      => Faker::Internet.url,
              :user_id  => rand(1..3)
end

30.times do
  Comment.create :body    => Faker::Lorem.paragraph,
                 :user_id => rand(1..3),
                 :post_id => rand(1..10)
end
