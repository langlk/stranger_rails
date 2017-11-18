class EpisodesController < ApplicationController
  def index
    if params['method']
      @method = params['method']
      if @method == 'chronological'
        @episodes = Episode.chronological
      else
        @episodes = Episode.alphabetical
      end
    else
      @method = 'chronological'
      @episodes = Episode.chronological
    end
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def new
    if current_user && current_user.admin
      @episode = Episode.new
    else
      flash[:alert] = "This area has been quarantined. Please keep a safe distance."
      redirect_to episodes_path
    end
  end

  def create
    if current_user && current_user.admin
      @episode = Episode.new(episode_params)
      if @episode.save
        flash[:notice] = "Episode created!"
        redirect_to episodes_path
      else
        render :new
      end
    else
      flash[:alert] = "Hazmat suits only in this area. Please keep out."
      redirect_to episodes_path
    end
  end

  def edit
    @episode = Episode.find(params[:id])
    if current_user && current_user.admin
      render :edit
    else
      flash[:alert] = "Authorized Hawkins Lab employees only beyond this point."
      redirect_to episode_path(@episode)
    end
  end

  def update
    @episode = Episode.find(params[:id])
    if current_user && current_user.admin
      if @episode.update(episode_params)
        flash[:notice] = "Episode updated!"
        redirect_to episode_path(@episode)
      else
        render :edit
      end
    else
      flash[:alert] = "Where is your Hawkins Lab id? Please depart at once."
      redirect_to episode_path(@episode)
    end
  end

  def destroy
    @episode = Episode.find(params[:id])
    if current_user && current_user.admin
      @episode.reviews.each do |review|
        review.destroy
      end
      @episode.scenes.each do |scene|
        scene.destroy
      end
      @episode.destroy
      flash[:notice] = "Episode '#{@episode.title}' was taken by the Demogorgon."
      redirect_to episodes_path
    else
      flash[:alert] = "You are not powerful enough to accomplish that. Best leave it to Eleven."
      redirect_to episodes_path(@episode)
    end
  end

private
  def episode_params
    params.require(:episode).permit(:title, :season, :number, :description)
  end
end
