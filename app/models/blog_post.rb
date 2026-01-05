class BlogPost < ApplicationRecord
    belongs_to :user
    has_one_attached :audio
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user

    validates :title, presence: true
    validates :body, presence: true
    validates :audio, content_type: [ "audio/mpeg", "audio/x-wav" ], allow_nil: true

    def liked_by?(user)
      likes.exists?(user_id: user.id)
    end
end
