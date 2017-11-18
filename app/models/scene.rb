class Scene < ActiveRecord::Base
  belongs_to :episode
  belongs_to :plotline
  belongs_to :user
  validates :episode, :plotline, :description, presence: true

  scope :intersect, -> (scene_plot, scene_ep) { where(plotline: scene_plot, episode: scene_ep) }
end
