class User < ActiveRecord::Base
  has_many :reviews
  has_many :movies
  has_secure_password

  validates :password, presence: true, on: :create
  validates :email, uniqueness: true, on: :create
  before_save :capitalize_names

  def name
    "#{first_name} #{last_name}"
  end

  private

  def capitalize_names
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end
end
