class Posts::LikesController < Posts::ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  
  def create
    @like = current_user.post_likes.new(likes_params)
    respond_to do |format|
      if @like.save
        format.html { redirect_to @like.post}
        format.json { render :show, status: :created, location: @like.post }
      else
       flash[:notice] = @like.errors.full_messages.to_sentence
      end
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
    params.permit(:post_id)
  end
end
