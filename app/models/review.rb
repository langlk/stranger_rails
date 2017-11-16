class Review < ActiveRecord::Base
  belongs_to :episode
  belongs_to :user
  validates :episode, :content, :rating, :user, presence: true
end
