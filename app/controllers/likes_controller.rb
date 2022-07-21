# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(likes_params)
    if @like.save
      redirect_to @like.post
    else
      flash[:notice] = @like.errors.full_messages.to_sentence
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    post = @like.post
    @like.destroy
    redirect_to post
  end

  private

  def likes_params
    params.permit(:post_id).merge(user_id: current_user.id)
  end
end
