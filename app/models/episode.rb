class Episode < ActiveRecord::Base
  has_many :scenes
  has_many :reviews
  has_many :plotlines, through: :scenes
  validates :title, :season, :number, presence: true

  scope :chronological, -> { order(season: :asc, number: :asc) }
  scope :alphabetical, -> { order(:title) }

  def rating
    rating_total = self.reviews.reduce(0) do |sum, review|
      sum + review.rating
    end
    rating_total.to_f / self.reviews.length
  end
end
