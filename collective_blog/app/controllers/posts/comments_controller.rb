class Posts::CommentsController < Posts::ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
     @comment = current_user&.post_comments&.new(comment_params)
     if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to post_path(params[:post_id], anchor: "comment-#{@comment.id}")
     else
      flash[:alert] = @comment.errors.full_messages.to_sentence
      redirect_to post_path(params[:post_id])
     end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id).merge(post_id: params[:post_id])
  end

end
