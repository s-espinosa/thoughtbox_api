class LinksController < ApplicationController
  def index
    if current_user
      @links = current_user.links
    end
  end
end
