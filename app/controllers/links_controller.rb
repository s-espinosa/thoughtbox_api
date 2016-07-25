class LinksController < ApplicationController
  def index
    if current_user
      @link = Link.new
      @links = current_user.links
    end
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      @link.update(user_id: current_user.id)
      redirect_to links_path
    else
      flash.now[:error] = "Invalid. Try Again."
      @links = current_user.links
      render :index
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:message] = "Link successfully updated!"
      redirect_to links_path
    else
      flash.now[:error] = "Invalid. Try Again."
      render :edit
    end
  end

  private
  def link_params
    params.require(:link).permit(:url, :title)
  end
end
