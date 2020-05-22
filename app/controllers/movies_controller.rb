class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.find(params[:id])
    @movie.actors.create!(actor_movie_params)
    redirect_to "/movies/#{@movie.id}"
  end

  private
  def actor_movie_params
    params.permit(:name)
  end
end
