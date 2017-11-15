class ScenesController < ApplicationController
  def new
    if params[:plotline_id]
      @plotline = Plotline.find(params[:plotline_id])
    end
    @scene = Scene.new
  end

  def create
    @scene = Scene.new(scene_params)
    if @scene.save
      flash[:notice] = "Scene created!"
      redirect_to scene_path(@scene)
    else
      render :new
    end
  end

  def show
    @scene = Scene.find(params[:id])
  end

private
  def scene_params
    params.require(:scene).permit(:description, :episode_id, :plotline_id)
  end
end
