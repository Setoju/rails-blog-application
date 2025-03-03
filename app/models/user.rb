class User < ApplicationRecord
    has_secure_password
    has_many :blog_post

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
    validates :name, presence: true
    validates :password, presence: true, confirmation: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
  end
  