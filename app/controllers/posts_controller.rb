class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def show
     @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Try again? :)"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was gladly updated"
      redirect_to @post
    else
      flash[:error] = "Hmm, we are unable to save the post... Sorry!"
      render :edit
    end

end
end