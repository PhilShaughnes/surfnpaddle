class ShareController < ApplicationController

  before_action :find_post

  def create
    flash[:success] = "shared!"
    UserMailer.share(@post, share_params).deliver
    redirect_to @post
  end

  def new
    flash[:share] = "enter email to share with!"
    redirect_to @post
  end

  private

  def share_params
    params.require(:share).permit(:email)
  end

  def find_post
    @post = params[:id] ? Post.find(params[:id]) : nil #Post.first
  end

end
