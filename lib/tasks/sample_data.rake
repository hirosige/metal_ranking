namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_bands
    make_microposts
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.jp",
                       password: "foobar",
                       password_confirmation: "foobar",
                       admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.jp"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_bands
  1000.times do |n|
    name  = Faker::Company.name
    place = "place-#{n+1}"
    genre = "Metal-sub#{n+1}"
    rate = 0 #Faker::Number.number(1)
    rating_ct = 0
    review = Faker::Lorem.sentence(1)
    biography =  Faker::Lorem.sentence(1)
    established_date = "2014/10/31"
    Band.create!(name: name,
                 place: place,
                 genre: genre,
                 rate: rate,
                 rating_ct: rating_ct,
                 review: review,
                 biography: biography,
                 established_date: established_date
                 )
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end