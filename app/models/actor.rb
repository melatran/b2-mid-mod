class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def list_costars
    movies.joins(:actors).where("actors.id !=#{self.id}").distinct.pluck("actors.name")
  end
end
