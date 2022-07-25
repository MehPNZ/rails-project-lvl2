# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:success] = t('comment.create')
      redirect_to post_path(@post, anchor: "comment-#{@comment.id}")
    else
      redirect_to post_path(@post), alert: @comment.errors.full_messages.to_sentence
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id).merge(post_id: params[:post_id], user_id: current_user.id)
  end
end
