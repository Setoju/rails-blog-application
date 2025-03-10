class BlogPostsController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :set_blog_post, only: [:update, :destroy]
  
  def index
    @post = BlogPost.new
    @blog_posts = BlogPost.where(published: true).page(params[:page]).per(5)
  end

  def create
    @post = BlogPost.new(post_params)
    @post.user_id = session[:user_id]
  
    if @post.save
      if params[:blog_post][:scheduled_time].present?
        local_time = params[:blog_post][:scheduled_time].to_time.utc
        
        PublishBlogPostJob.set(wait_until: local_time).perform_later(@post.id)
        redirect_to root_path, notice: "Your post will be published at #{params[:blog_post][:scheduled_time]} (your local time)"
      else
        @post.update(published: true)
        redirect_to root_path, notice: 'Successfully posted your content.'
      end
    else
      render :new
    end
  end

  def update
    if @blog_post.update(post_params)
      redirect_to profile_path(page: params[:page]), notice: 'Post updated successfully.'
    else
      render 'profiles/index', alert: 'Error updating post.'
    end
  end

  def search
    @query = params[:query]
    @blog_posts = BlogPost.where("title ILIKE ?", "%#{@query}%").where(published: true).page(params[:page]).per(5)
  end

  def destroy
    if @blog_post
      @blog_post.destroy
      flash[:notice] = "Post was successfully deleted."
      redirect_to profile_path
    end
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def post_params
    params.require(:blog_post).permit(:title, :body)
  end
end
