# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# u = User.create(email: 'nada@nada.com', password: '123123')

user = User.first

(1..21).to_a.each do |n|
  post = Post.new(description: Faker::Lorem.sentences(number: 1, supplemental: true), user: user)
  current_num = n < 10 ? "0#{n}" : n
  post.image.attach(io: File.open("app/assets/images/#{current_num}.jpg"), filename: "#{current_num}.jpg")

  if post.save
    puts "Se ha creado el post con id: #{post.id}"
  else
    puts "El post #{n} no se ha creado"
  end
end
