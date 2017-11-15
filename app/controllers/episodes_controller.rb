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

  def edit
    @episode = Episode.find(params[:id])
  end

  def update
    @episode = Episode.find(params[:id])
    if @episode.update(episode_params)
      flash[:notice] = "Episode updated!"
      redirect_to episode_path(@episode)
    else
      render :edit
    end
  end

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
    flash[:notice] = "Episode '#{@episode.title}' was taken by the Demogorgon."
    redirect_to episodes_path
  end

private
  def episode_params
    params.require(:episode).permit(:title, :season, :number, :description, :rating)
  end
end
