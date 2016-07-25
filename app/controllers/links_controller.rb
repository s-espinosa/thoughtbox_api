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
      render :index
    end
  end

  private
  def link_params
    params.require(:link).permit(:url, :title)
  end
end
