class Review < ActiveRecord::Base
  belongs_to :episode
  validates :episode, :content, :rating, :author, presence: true
end
