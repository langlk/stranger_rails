class Plotline < ActiveRecord::Base
  has_many :scenes
  has_many :episodes, through: :scenes
  validates :name, presence: true
end
