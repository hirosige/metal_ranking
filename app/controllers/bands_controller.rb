class BandsController < ApplicationController

  def index
    @bands = Band.paginate(page: params[:page])
  end

  def show
    @band = Band.find(params[:id])
  end

end
