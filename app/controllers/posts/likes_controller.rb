# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @like = PostLike.new(likes_params)
    if @like.save
      redirect_to @like.post
    else
      flash[:notice] = @like.errors.full_messages.to_sentence
    end
  end

  def destroy
    @like = current_user.post_likes.find(params[:id])
    post = @like.post
    @like.destroy
    redirect_to post
  end

  private

  def likes_params
    params.permit(:post_id).merge(user_id: current_user.id)
  end
end
