class Movie < ActiveRecord::Base
  has_many :reviews

  validates :title, presence: true, uniqueness: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true, length: { minimum: 3 }
  validates :poster_image_url, presence: true
  validate :release_date_is_in_the_future

  before_save :titleize_movie

  private

  def titlelize_movie
    title = title.titleize
  end

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, 'should probably be in the future') if release_date < Date.today
    end
  end
end
