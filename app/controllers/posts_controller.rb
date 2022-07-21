# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index new]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.order created_at: :desc
  end

  def show
    @comment = @post.post_comments.build
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = t('post.action_create')
      redirect_to post_url(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        flash[:success] = t('post.action_update')
        format.html { redirect_to post_url(@post) }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    flash[:success] = t('post.action_destroy')
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id).merge(user_id: current_user.id)
  end
end
