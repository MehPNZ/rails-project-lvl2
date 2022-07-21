# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :set_comment, only: %i[update destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params_create)
    if @comment.save
      flash[:success] = t('comment.create')
      redirect_to post_path(params[:post_id], anchor: "comment-#{@comment.id}")
    else
      redirect_to post_path(params[:post_id]), alert: @comment.errors.full_messages.to_sentence
    end
  end

  def update
    if @comment.update(comment_params_update)
      flash[:success] = t('comment.update')
      redirect_to post_path(@comment.post_id, anchor: "comment-#{@comment.id}")
    else
      redirect_to post_path(@comment.post_id), alert: @comment.errors.full_messages.to_sentence
    end
  end

  def destroy
    post = @comment.post_id
    @comment.destroy
    flash[:success] = t('comment.destroy')
    redirect_to post_path(post)
  end

  private

  def set_comment
    @comment = PostComment.find(params[:id])
  end

  def comment_params_update
    params.require(:post_comment).permit(:content)
  end

  def comment_params_create
    params.require(:post_comment).permit(:content, :parent_id).merge(post_id: params[:post_id], user_id: current_user.id)
  end
end
