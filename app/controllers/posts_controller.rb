# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index new]

  def index
    @posts = Post.order created_at: :desc
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @like = current_user&.likes&.find_by(post: @post.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = t('post.action_create')
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id).merge(creator_id: current_user.id)
  end
end
