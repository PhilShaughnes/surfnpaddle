class PostsController < ApplicationController
  def index

  end

  def show
    @post = if params[:id]
      Post.find(params[:id])
    else
      Post.order("created_at").last #is the created_at necessary?
      "most recent post"
    end
  end

end
