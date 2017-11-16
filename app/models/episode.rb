class Episode < ActiveRecord::Base
  has_many :scenes
  has_many :reviews
  has_many :plotlines, through: :scenes
  validates :title, :season, :number, presence: true

  scope :chronological, -> { order(season: :asc, number: :asc) }
  scope :alphabetical, -> { order(:title) }
end
