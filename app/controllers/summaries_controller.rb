class SummariesController < ApplicationController
  def new
  end

 def show
     @summary = Summary.find(params[:id])
     @posts = @summary.posts
 end
end