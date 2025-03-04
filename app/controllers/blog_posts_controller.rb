class BlogPostsController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :set_blog_post, only: [:update, :destroy]
  
  def index
    @post = BlogPost.new
    @blog_posts = BlogPost.page(params[:page]).per(5)
  end

  def create
    post = BlogPost.new(post_params)
    post.user_id = session[:user_id]

    if post.save
      redirect_to root_path, notice: 'Successfully posted your content.'
    else
      render :new
    end
  end

  def update
    if @blog_post.update(post_params)
      redirect_to profile_path, notice: 'Post updated successfully.'
    else
      render 'profiles/index', alert: 'Error updating post.'
    end
  end

  def search
    @query = params[:query]
    @posts = BlogPost.where("title ILIKE ?", "%#{@query}%")
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
