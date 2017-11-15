class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @episode = Episode.find(params[:episode_id])
    @review = @episode.reviews.new
  end

  def create
    @episode = Episode.find(params[:episode_id])
    @review = @episode.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review created!"
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @episode = @review.episode
    if @review.update(review_params)
      flash[:notice] = "Review updated!"
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review has gone to be with Barb."
    redirect_to reviews_path
  end

private
  def review_params
    params.require(:review).permit(:content, :episode_id, :author, :rating)
  end
end
