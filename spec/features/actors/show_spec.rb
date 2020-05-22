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

  it "can display a unique list of all the actors worked with- no actor will be duplicated" do
    visit "/actors/#{@johnny.id}"
    expect(page).to have_content( ["Keira Knightley", "Orlando Bloom"])

    #add orlando again to check name isn't duplicated in costar list
    visit "/movies/#{@pirates.id}"
    fill_in :name, with: "Orlando Bloom"
    click_on "Add Actor to Movie"

    #add Geoffrey to check new costar was added can be added to costar list in show page
    visit "/movies/#{@pirates.id}"
    fill_in :name, with: "Geoffrey Rush"
    click_on "Add Actor to Movie"

    #check orlando isnt added twice and geoffrey is now added
    visit "/actors/#{@johnny.id}"
    expect(page).to have_content(["Geoffrey Rush", "Keira Knightley", "Orlando Bloom"])

  end
end

#if johnny's name is in pirates, don't add him to array
#add costars to array

# Story 4
# As a visitor,
# When I visit an actor's show page
# I see that actors name and age
# And I see a unique list of all of the actors this particular actor has worked with.
