class Episode < ActiveRecord::Base
  validates :title, :season, :number, :rating, presence: true
end
