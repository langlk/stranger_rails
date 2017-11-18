class ScenesController < ApplicationController
  def index
    if params[:episode_id]
      @episode = Episode.find(params[:episode_id])
    else
      @scenes = Scene.all
    end
  end

  def new
    if current_user
      if params[:plotline_id]
        @plotline = Plotline.find(params[:plotline_id])
      elsif params[:episode_id]
        @episode = Episode.find(params[:episode_id])
      end
      @scene = Scene.new
    else
      flash[:alert] = "You must be logged in to add a scene."
      redirect_to scenes_path
    end
  end

  def create
    if current_user
      @scene = Scene.new(scene_params)
      @scene.user = current_user
      if @scene.save
        flash[:notice] = "Scene created!"
        redirect_to scene_path(@scene)
      else
        @episode = @scene.episode
        render :new
      end
    else
      flash[:alert] = "You must be logged in to add a scene."
      redirect_to scenes_path
    end
  end

  def show
    @scene = Scene.find(params[:id])
  end

  def edit
    @scene = Scene.find(params[:id])
    if current_user != @scene.user
      flash[:alert] = "This isn't your scene, please don't try to change it."
      redirect_to scene_path(@scene)
    else
      render :edit
    end
  end

  def update
    @scene = Scene.find(params[:id])
    if current_user != @scene.user
      flash[:alert] = "Please refrain from changing other users' scenes."
      redirect_to scene_path(@scene)
    else
      if @scene.update(scene_params)
        flash[:notice] = "Scene updated!"
        redirect_to scene_path(@scene)
      else
        render :edit
      end
    end
  end

  def destroy
    @scene = Scene.find(params[:id])
    if !current_user || ((current_user != @scene.user) && !current_user.is_admin?)
      flash[:alert] = "You really shouldn't be here, kid."
      redirect_to scene_path(@scene)
    else
      @scene.destroy
      flash[:notice] = "Scene has been taken by the Demogorgon."
      redirect_to scenes_path
    end
  end

private
  def scene_params
    params.require(:scene).permit(:description, :episode_id, :plotline_id)
  end
end
