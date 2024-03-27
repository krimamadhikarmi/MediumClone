class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :is_owner?, only: [:edit, :update, :destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    if @comment.valid?
      redirect_to @post
    else
      flash[:alert] = "Invalid params"
      redirect_to @post
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    redirect_to @post
  end

  def index
    @posts = Post.all
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.valid?
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end
    
  private
  def set_post
    @post = Post.find(params[:post_id])
  end
  
  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:description, :post_id, :user_id)
  end

  def is_owner?
    # redirect_to root_path if Comment.find(params[:id]).user != current_user
    unless @comment.user==current_user || @post.user==current_user
      redirect_to root_path
      return
    end
  end

end

