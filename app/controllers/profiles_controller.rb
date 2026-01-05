class ProfilesController < ApplicationController
    before_action :require_user

    def index
      page = params[:page] || 1
      scope = BlogPost.includes(:likes, :comments)
                      .where(user_id: Current.user.id, published: true)

      if params[:query].present?
        scope = scope.where("title ILIKE ?", "%#{params[:query]}%")
      end

      @blog_posts = scope.page(page).per(5)
      @editing_post = BlogPost.find_by(id: params[:editing_post_id]) if params[:editing_post_id].present?
    end
end
