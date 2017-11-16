class Review < ActiveRecord::Base
  belongs_to :episode
  belongs_to :user
  validates :episode, :content, :rating, :user, presence: true

  scope :recent, -> { where("created_at >=?", DateTime.now - 7.days).order(updated_at: :desc).limit(11)}

end
