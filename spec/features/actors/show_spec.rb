require "rails_helper"

RSpec.describe "Actors Show Page" do
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

  it "can dispay and actors name and age" do
    visit "/actors/#{@johnny.id}"

    expect(page).to have_content("Johnny Depp")
    expect(page).to have_content("Age: 56")
  end
end



# Story 4
# As a visitor,
# When I visit an actor's show page
# I see that actors name and age
# And I see a unique list of all of the actors this particular actor has worked with.
