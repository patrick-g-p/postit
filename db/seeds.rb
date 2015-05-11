# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "Patrick")

Post.create(title: "Tealeaf", url: "http://gotealeaf.com", description: "An online school for developers")

%w(Programming Gaming Technology News Humor).each do |category|
  Category.find_or_create_by_name(category)
end

Comment.create(body: "What an excellent way to learn Rails!")

User.first.posts << Post.first

Post.first.categories << Category.first

User.first.comments << Comment.first

Post.first.comments << Comment.first
