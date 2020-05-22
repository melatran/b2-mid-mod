require "rails_helper"

RSpec.describe Actor do
  describe "relationships" do
    it { should have_many :actor_movies}
    it { should have_many(:movies).through(:actor_movies)}
  end

  describe "methods" do
    it ".list_costars" do
      disney = Studio.create(name: "Walt Disney", location: "Anaheim")
      pirates = Movie.create(title: "Pirates of the Carribean", creation_year: "2003", genre: "Action", studio_id: disney.id)
      johnny = Actor.create(name: "Johnny Depp", age: "56")
      keira = Actor.create(name: "Keira Knightley", age: "35")
      orlando = Actor.create(name: "Orlando Bloom", age: "43")
      ActorMovie.create(movie_id: pirates.id, actor_id: johnny.id)
      ActorMovie.create(movie_id: pirates.id, actor_id: keira.id)
      ActorMovie.create(movie_id: pirates.id, actor_id: orlando.id)

      expect(johnny.list_costars).to eq(["Keira Knightley", "Orlando Bloom"])
    end
  end
end
