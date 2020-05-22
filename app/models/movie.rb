class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def sort_by_age
    actors.order(:age)
  end

  def average_actor_age
    actors.average(:age).to_f
  end
end
