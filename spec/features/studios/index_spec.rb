require "rails_helper"

RSpec.describe "Studio Index Page" do
  before :each do
    @disney = Studio.create(name: "Walt Disney", location: "Anaheim")
    @universal = Studio.create(name: "Universal Studios", location: "Hollywood")
    @nemo = Movie.create(title: "Finding Nemo", creation_year: "2003", genre: "Animation", studio_id: @disney.id)
    @pirates = Movie.create(title: "Pirates of the Carribean", creation_year: "2003", genre: "Action", studio_id: @disney.id)
    @minions = Movie.create(title: "Despicable Me", creation_year: "2010", studio_id: @universal.id)
  end

  it "can display all the studios with a list of all its movies" do
    visit "/studios"

    within ".studios-#{disney.id}" do
      expect(page).to have_content("Walt Disney")
      expect(page).to have_content("Finding Nemo")
      expect(page).to have_content("Pirates of the Carribean")
    end

    within ".studios-#{universal.id}" do
      expect(page).to have_content("Universal Studios")
      expect(page).to have_content("Despicable Me")
    end
  end
end




#
# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.
