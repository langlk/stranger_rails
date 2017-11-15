class PlotlinesController < ApplicationController
  def index
    @plotlines = Plotline.all
  end

  def show
    @plotline = Plotline.find(params[:id])
  end
end
