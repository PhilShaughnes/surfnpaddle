class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit]

  def index
    p params
    @posts = params[:user_id] ? User.find(params[:user_id] ).posts.page(params[:page]) : Post.page(params[:page])
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

def update
  if @post.update(post_params)
    redirect_to @post
  else
    render :edit
  end
end

  private

  def find_post
    @post = params[:id] ? Post.find(params[:id]) : Post.first
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :photo)
  end

end
