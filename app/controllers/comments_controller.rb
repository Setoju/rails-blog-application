class CommentsController < ApplicationController
  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.create(comment_params)
    redirect_to root_path, notice: 'Comment was successfully created.'
  end

  def destroy
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.find(params[:id])
    @comment.destroy
    redirect_to root_path, notice: 'Comment was successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author_name)
  end
end