# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
disney = Studio.create(name: "Walt Disney", location: "Anaheim")
pirates = Movie.create(title: "Pirates of the Carribean", creation_year: "2003", genre: "Action", studio_id: disney.id)
johnny = Actor.create(name: "Johnny Depp", age: "56")
keira = Actor.create(name: "Keira Knightley", age: "35")
orlando = Actor.create(name: "Orlando Bloom", age: "43")
ActorMovie.create(movie_id: pirates.id, actor_id: johnny.id)
ActorMovie.create(movie_id: pirates.id, actor_id: keira.id)
ActorMovie.create(movie_id: pirates.id, actor_id: orlando.id)
