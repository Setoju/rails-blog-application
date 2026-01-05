class BlogPost < ApplicationRecord
    belongs_to :user
    has_one_attached :audio
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :liking_users, through: :likes, source: :user

    validates :title, presence: true
    validates :body, presence: true
    validates :audio, content_type: [ "audio/mpeg", "audio/x-wav" ], allow_nil: true

    scope :search, ->(query) {
      where("title ILIKE ?", "%#{query}%") if query.present?
    }

    scope :published_only, -> {
      where(published: true)
    }

    scope :by_user, ->(user_id) {
      where(user_id: user_id) if user_id.present?
    }

    def liked_by?(user)
      likes.exists?(user_id: user.id)
    end
end
