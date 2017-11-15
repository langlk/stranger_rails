class Plotline < ActiveRecord::Base
  validates :name, presence: true
end
