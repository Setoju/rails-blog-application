class PublishBlogPostJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = BlogPost.find_by(id: post_id)
    return unless post

    post.update(published: true)
  end
end
