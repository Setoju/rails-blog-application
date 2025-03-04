class ProfilesController < ApplicationController
    before_action :require_user

    def index
      @blog_posts = BlogPost.where(user_id: Current.user.id).order(created_at: :desc)
      @editing_post = BlogPost.find_by(id: params[:editing_post_id]) if params[:editing_post_id].present?
    end
end
