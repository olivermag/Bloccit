
class CommentsController < ApplicationController

  def create

    @topic = Topic.find(params[:topic_id])
    @post  = Post.find(params[:post_id])

    @comment = Comment.new(comment_params)

    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      
      
      flash[:errors_messages]=@comment.errors.messages
      redirect_to [@topic, @post]
    end

  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
