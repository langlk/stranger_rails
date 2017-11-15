class Episode < ActiveRecord::Base
  validates :title, :season, :number, :rating, presence: true

  scope :chronological, -> { order(season: :asc, number: :asc) }
  scope :alphabetical, -> { order(:title) }
end
