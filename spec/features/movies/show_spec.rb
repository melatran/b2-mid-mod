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

  it "can add an actor to movie show page" do

    visit "/movies/#{@pirates.id}"

    fill_in :name, with: "Geoffrey Rush"

    click_on "Add Actor to Movie"
    
    expect(current_path).to eq("/movies/#{@pirates.id}")
    expect(page).to have_content("Geoffrey Rush")
  end
end

# Story 3
# As a visitor,
# When I visit a movie show page,
# I see a form for an actors name
# and when I fill in the form with an existing actor's name
# I am redirected back to that movie's show page
# And I see the actor's name listed
# (This should not break story 3, You do not have to test for a sad path)
