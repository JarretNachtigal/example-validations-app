class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  # validates :email, format: { with: , message: "invalid email"}

end
