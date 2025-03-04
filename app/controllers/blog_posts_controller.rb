class BlogPostsController < ApplicationController
  #TODO: add before action for require_user using except index
  def index
    @post = BlogPost.new
    @blog_posts = BlogPost.all
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
    post = BlogPost.find(params[:id])

    if post.update(post_params)
      redirect_to profile_path, notice: 'Post updated successfully.'
    else
      render 'profiles/index', alert: 'Error updating post.'
    end
  end

  def destroy
    blog_post = set_blog_post
    if blog_post
      blog_post.destroy
      flash[:notice] = "Post was successfully deleted."
      redirect_to profile_path
    end
  end

  private

  def set_blog_post
    blog_post = BlogPost.find(params[:id])
  end

  def post_params
    params.require(:blog_post).permit(:title, :body)
  end
end
