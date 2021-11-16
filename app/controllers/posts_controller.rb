class PostsController < ApplicationController

  def index
    #add conditional to account for whether user is trying to access all posts
    #or just the index of posts by a certain author

    #params[:author_id] came from nested route
    if params[:author_id]
      @posts = Author.find(params[:author_id]).posts
    else 
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:title, :desription, :post_status, :author_id)
  end
end
