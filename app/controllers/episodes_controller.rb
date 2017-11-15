class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params)
    if @episode.save
      flash[:notice] = "Episode created!"
      redirect_to episodes_path
    else
      render :new
    end
  end

private
  def episode_params
    params.require(:episode).permit(:title, :season, :number, :description, :rating)
  end
end
