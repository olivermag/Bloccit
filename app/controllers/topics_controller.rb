
class TopicsController < ApplicationController
  
  def index
     @topics = Topic.paginate(page: params[:page], per_page: 10)
    # authorize @topics
  end

  def new
     @topic = Topic.new
     authorize @topic
  end

   def show
     @topic = Topic.find(params[:id])
     @posts = @topic.posts.paginate(page: params[:page], per_page: 10)
     authorize @topic
  end

  def edit
     @topic = Topic.find(params[:id])
     authorize @topic
  end
 
  def set_page_info(count)
    if params[:page] == nil
      page = 1
    else
      page = params[:page].to_i
  end
  return {"page" => page, "perpage" => 10, "max_item" => count}
end

   def create
     @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
     authorize @topic
     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash[:error] = "Error creating topic. Please try again."
       render :new
     end
   end
 
   def update
     @topic = Topic.find(params[:id])
     authorize @topic
     if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
       redirect_to @topic
     else
       flash[:error] = "Error saving topic. Please try again."
       render :edit
     end
   end
end