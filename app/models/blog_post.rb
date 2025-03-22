class BlogPost < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user

    validates :title, presence: true
    validates :body, presence: true

    def liked_by?(user)
      likes.exists?(user_id: user.id)
    end
end
