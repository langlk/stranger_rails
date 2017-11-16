class Episode < ActiveRecord::Base
  has_many :scenes
  has_many :reviews
  has_many :plotlines, through: :scenes
  validates :title, :season, :number, presence: true

  scope :chronological, -> { order(season: :asc, number: :asc) }
  scope :alphabetical, -> { order(:title) }

  def rating
    if self.reviews.any?
      rating_total = self.reviews.reduce(0) do |sum, review|
        sum + review.rating
      end
      return rating_total.to_f / self.reviews.length
    else
      return nil
    end
  end
end
