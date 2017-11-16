class Episode < ActiveRecord::Base
  has_many :scenes
  has_many :reviews
  has_many :plotlines, through: :scenes
  validates :title, :season, :number, presence: true

  scope :chronological, -> { order(season: :asc, number: :asc) }
  scope :alphabetical, -> { order(:title) }
  scope :most_reviewed, -> {(
    select("episodes.id, episodes.title, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("episodes.id")
    .order("reviews_count DESC")
    .limit(5)
    )}
    scope :unreviewed, -> {
      includes(:reviews)
      .where(reviews: { episode_id: nil })
      .order(:season, :number)
      .limit(5)
    }
  scope :random, -> { order("RANDOM()").first }

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
