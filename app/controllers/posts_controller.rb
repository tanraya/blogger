class PostsController < ApplicationController
  before_filter :authenticate_user!, except: %w(index show)
  before_action :set_post, only: [:edit, :update, :destroy, :image]

  # Show posts from all users
  def index
    @posts = Post.includes(:author).descending
  end

  def show
    @post = Post.find(params[:id])
    @force_reload = !!params[:force_reload]
  end

  def new
    @post = current_user.posts.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save

    respond_with @post
  end

  def update
    @post.update(post_params)
    respond_with @post, location: post_path(@post, :force_reload => true)
  end

  def destroy
    @post.destroy
    respond_with @post
  end

  def image
    render json: { uri: @post.image_url(:thumb) }
  end

private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :article, :author_id, :image_to_download)
  end
end
