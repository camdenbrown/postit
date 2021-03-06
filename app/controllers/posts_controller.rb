class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = "You created a post!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash[:notice] = "This post has been updated!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def require_same_user
    if @post.creator.username != current_user.username
      flash[:error] = "You aren't allowed to do that!"
      redirect_to root_path
    end
  end
end
