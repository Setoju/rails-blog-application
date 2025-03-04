class ProfilesController < ApplicationController
    before_action :require_user

    def index
      @blog_posts = BlogPost.where(user_id: Current.user.id).order(created_at: :desc)
    end
end
