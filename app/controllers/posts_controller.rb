class PostsController < ApplicationController
  before_filter :logged_in_user, only: [:create]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post submitted."
      redirect_to @post
    else
      flash.now[:danger] = "Error in post submission."
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
