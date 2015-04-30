class Movie < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :reviews

  validates :title, presence: { message: "The title can't be blank!" }, uniqueness: { message: "This movie already exists on our site!"}
  validates :director, presence: { message: "Director can't be blank!" }
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: { message: "Give this movie a description" }
  validates :image, presence: { message: "Please attach an image" }

  before_save :titleize_movie

  scope :search, lambda { |term| where(['lower(title) LIKE ? OR lower(director) LIKE ?', "%#{term.downcase}%", "%#{term.downcase}%"]) }

  def average_rating
    if reviews.count > 0
      "#{reviews.sum(:rating_out_of_ten) / reviews.size}/10"
    else
      "No reviews yet"
    end
  end

  private

  def titleize_movie
    title.titleize
  end

end
