class User < ActiveRecord::Base

  has_secure_password

  validates :password, presence: true, on: :create
  validates :email, uniqueness: true, on: :create
  before_save :capitalize_names

  def name
    "#{first_name} #{last_name}"
  end

  private

  def capitalize_names
    first_name.capitalize
    last_name.capitalize
  end
end
