require "rails_helper"

RSpec.describe "Movie Show Page" do
  before :each do
    @disney = Studio.create(name: "Walt Disney", location: "Anaheim")
    @pirates = Movie.create(title: "Pirates of the Carribean", creation_year: "2003", genre: "Action", studio_id: @disney.id)
    @johnny = Actor.create(name: "Johnny Depp", age: "56")
    @keira = Actor.create(name: "Keira Knightley", age: "35")
    @orlando = Actor.create(name: "Orlando Bloom", age: "43")
    ActorMovie.create(movie_id: @pirates.id, actor_id: @johnny.id)
    ActorMovie.create(movie_id: @pirates.id, actor_id: @keira.id)
    ActorMovie.create(movie_id: @pirates.id, actor_id: @orlando.id)
  end

  it "can display movie's, title, creation year, genre, actors from youngest to oldest, and average age" do
    visit "/movies/#{@pirates.id}"
    expect(page).to have_content("Pirates of the Carribean")
    expect(page).to have_content("Created In: 2003")
    expect(page).to have_content("Genre: Action")
    expect("Keira Knightley").to appear_before("Orlando Bloom")
    expect("Orlando Bloom").to appear_before("Johnny Depp")
    expect(page).to have_content("Average Age of Actors: 44.67 years old")
  end
end








# As a visitor,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
