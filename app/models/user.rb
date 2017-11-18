class User < ApplicationRecord
  attr_accessor :password

  has_many :reviews
  validates_confirmation_of :password
  validates :email, :name, presence: true, uniqueness: true
  before_save :encrypt_password

  scope :top_reviewers, -> {(
    select("users.id, users.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("users.id")
    .order("reviews_count DESC")
    .limit(11)
    )}

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by "email = ?", email
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

end
