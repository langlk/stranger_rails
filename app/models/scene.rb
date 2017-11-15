class Scene < ActiveRecord::Base
  belongs_to :episode
  belongs_to :plotline
  validates :episode, :plotline, :description, presence: true
end
