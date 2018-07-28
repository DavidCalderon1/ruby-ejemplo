# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!({
  email:                 'jhone.cortesg@gmail.com',
  password:              'password',
  password_confirmation: 'password'
})

(0..10).each do |array|
  q = Question.create({
    title: "Titulo de la pregunta #{array}",
    description: "Esto es un ejemplo de
    una descripcion de una pregunta",
    user_id: user.id
  })

  (0..5).each do |a|
    q.answers.create({text: "Respuesta #{a}", user_id: user.id})
  end
end
