class Posts::CommentsController < Posts::ApplicationController

  def create
     @comment = current_user.post_comments.new(comment_params)
     if @comment.save
      redirect_to post_path(params[:post_id], anchor: "comment-#{@comment.id}")
     else
      flash[:notice] = @comment.errors.full_messages.to_sentence
     end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id).merge(post_id: params[:post_id])
  end

end
