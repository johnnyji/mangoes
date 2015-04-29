class Movie < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :reviews

  validates :title, presence: true, uniqueness: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :image, presence: true
  validate :release_date_is_in_the_future

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

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, 'should probably be in the future') if release_date < Date.today
    end
  end
end
