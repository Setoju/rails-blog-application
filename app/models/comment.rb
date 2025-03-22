class Comment < ApplicationRecord
  belongs_to :blog_post
  validates :content, presence: true
  validates :author_name, presence: true
end
