class Api::V1::LinksController < Api::ApiController
  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      respond_with(@link)
    end
  end

  private
  def link_params
    params.permit(:read)
  end
end
