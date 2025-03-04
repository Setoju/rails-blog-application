class ProfilesController < ApplicationController
    before_action :require_user

    # TODO: Add show, ask chat
    def index
      @blog_posts = BlogPost.where(user_id: Current.user.id).order(created_at: :desc)

      if params[:editing_post_id]
        @editing_post = BlogPost.find_by(id: params[:editing_post_id])
      else
        @editing_post = nil
      end
    end

    private

    def require_user
      if Current.user.nil?
        flash[:alert] = "You must be signed in to view your profile"
        redirect_to sign_in_path
      end
    end
end
