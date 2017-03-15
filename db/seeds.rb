# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def new_users
  print "\nadding 5 new users: "
  users = []
  print "made array, "
  5.times do
    print '.'
    user = User.create!(
      name: "#{Faker::Superhero.descriptor} #{Faker::Superhero.suffix}",
      photo: Faker::LoremPixel.image("100x100", false, 'people', users.length+1) ,
      bio: Faker::StarWars.quote,
      password: "password",
      email: Faker::Internet.safe_email
    )
    users << user
  end
  users
end

#This method adds avatar urls to users who have none.
# Note: Users created manually through the web interface will have an empty string for their avatar. This will not update those.
def new_photo_url(users)
  print "\nUpdating NULL avatar (Note: empty strings will not be updated): "
  users.each do |user|
    print '.'
    user.photo ||= Faker::Avatar.image(user.name, "100x100")
    user.save
  end
end

#This method adds 3 posts for any users that have less than 3 posts.
def new_posts(users)
  print "\nchecking for posts: "
  users.each do |user|
    3.times do
      print '.'
      user.posts.create!(
        title: Faker::Book.title,
        body: Faker::Hipster.paragraphs(4).join("\n\n"),
        photo: Faker::LoremPixel.image("400x400", false, 'transport', rand(1..10)),
        summary: Faker::HarryPotter.quote,
        created_at: rand(1...700).days.ago
      )
    end if user.posts.count < 3
  end
end

def passwordgen(users)
  print "\nchecking for passwords"
  users.each do |u|
    unless u.password_digest
      print '.'
      u.password = "password"
      u.password_confirmation = "password"
      u.save
    end
  end
end

def emailgen(users)
  print "\nchecking for email addresses"
  users.each do |u|
    unless u.email
      print '.'
      u.email = Faker::Internet.safe_email
      u.save
    end
  end
end

print "starting..."

#run the methods here.
# this runs new_users if there are less than 5 users in the database.
userslist = User.all.length < 5 ? new_users : User.all

new_posts(userslist)
new_photo_url(userslist)
passwordgen(userslist)
emailgen(userslist)
puts "\nDone."
