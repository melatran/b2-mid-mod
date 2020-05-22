require "rails_helper"

RSpec.describe Movie do
  describe "relationships" do
    it { should belong_to :studio}
    it { should have_many :actor_movies}
    it { should have_many(:actors).through(:actor_movies)}
  end

  describe "methods" do
    it ".sort_by_age" do
      disney = Studio.create(name: "Walt Disney", location: "Anaheim")
      pirates = Movie.create(title: "Pirates of the Carribean", creation_year: "2003", genre: "Action", studio_id: disney.id)
      johnny = Actor.create(name: "Johnny Depp", age: "56")
      keira = Actor.create(name: "Keira Knightley", age: "35")
      orlando = Actor.create(name: "Orlando Bloom", age: "43")
      ActorMovie.create(movie_id: pirates.id, actor_id: johnny.id)
      ActorMovie.create(movie_id: pirates.id, actor_id: keira.id)
      ActorMovie.create(movie_id: pirates.id, actor_id: orlando.id)

      expect(pirates.sort_by_age).to eq([keira, orlando, johnny])
    end

    it ".average_actor_age" do
      disney = Studio.create(name: "Walt Disney", location: "Anaheim")
      pirates = Movie.create(title: "Pirates of the Carribean", creation_year: "2003", genre: "Action", studio_id: disney.id)
      johnny = Actor.create(name: "Johnny Depp", age: "56")
      keira = Actor.create(name: "Keira Knightley", age: "35")
      orlando = Actor.create(name: "Orlando Bloom", age: "43")
      ActorMovie.create(movie_id: pirates.id, actor_id: johnny.id)
      ActorMovie.create(movie_id: pirates.id, actor_id: keira.id)
      ActorMovie.create(movie_id: pirates.id, actor_id: orlando.id)

      expect(pirates.average_actor_age).to eq(0.446666666666666667e2)
    end
  end
end
