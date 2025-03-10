class ProfilesController < ApplicationController
    before_action :require_user

    def index
      page = params[:page] || 1
      @blog_posts = BlogPost.where(user_id: Current.user.id, published: true)
                           .page(page)
                           .per(5)
      @editing_post = BlogPost.find_by(id: params[:editing_post_id]) if params[:editing_post_id].present?
    end
end
