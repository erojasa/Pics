# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.first
user = User.create(email: 'nada@nada.com', password: '123123', first_name: 'Erick', last_name: 'Rojas')

9.times do |i|
  num = i + 1
  User.create(email: "user-0#{num}@example.com", password: '123123', first_name: "User 0#{num}", last_name: 'Example')
end

20.times do |i|
  (1..21).to_a.each do |n|
    post = Post.new(description: Faker::Lorem.sentences(number: 1, supplemental: true).join(''), user: user)
    current_num = n < 10 ? "0#{n}" : n
    post.image.attach(io: File.open("app/assets/images/#{current_num}.jpg"), filename: "#{current_num}.jpg")

    if post.save
      puts "Se ha creado el post con id: #{post.id}"
    else
      puts "El post #{n} no se ha creado"
    end
  end
end