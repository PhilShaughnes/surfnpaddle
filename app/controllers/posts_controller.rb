class PostsController < ApplicationController
  def index

  end

  def show
    @post = if params[:id]
      Post.find(params[:id])
    else
      Post.first#is the created_at necessary?
    end
  end

end
