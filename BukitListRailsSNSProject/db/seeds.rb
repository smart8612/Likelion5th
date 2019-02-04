# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in 1..2 do
   Post.create(
    title: i,
    content: i,
    editor: i,
    grade: 10,
    user_id: i
    )
end
for i in 1..2 do
   User.create(
    email: i
    )
end