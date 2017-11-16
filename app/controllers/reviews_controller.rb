class ReviewsController < ApplicationController
  def index
    if params[:episode_id]
      @episode = Episode.find(params[:episode_id])
      @reviews = @episode.reviews
    else
      @reviews = Review.all
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @episode = Episode.find(params[:episode_id])
    if current_user
      @review = @episode.reviews.new
    else
      flash[:alert] = "You must be logged in to leave a review."
      redirect_to episode_path(@episode)
    end
  end

  def create
    @episode = Episode.find(params[:episode_id])
    if current_user
      @review = @episode.reviews.new(review_params)
      @review.user = current_user
      if @review.save
        flash[:notice] = "Review created!"
        redirect_to review_path(@review)
      else
        render :new
      end
    else
      flash[:alert] = "You must be logged in to leave a review."
      redirect_to episode_path(@episode)
    end
  end

  def edit
    @review = Review.find(params[:id])
    if current_user != @review.user
      flash[:alert] = "This isn't your review. No touchy."
      redirect_to review_path(@review)
    end
  end

  def update
    @review = Review.find(params[:id])
    if current_user != @review.user
      flash[:alert] = "Seriously, kid. How did you get in here? This area is off-limits."
      redirect_to review_path(@review)
    else
      @episode = @review.episode
      if @review.update(review_params)
        flash[:notice] = "Review updated!"
        redirect_to review_path(@review)
      else
        render :edit
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if current_user != @review.user
      flash[:alert] = "Seriously, kid. How did you get in here? This area is off-limits."
      redirect_to review_path(@review)
    else
      @review.destroy
      flash[:notice] = "Review has gone to be with Barb."
      redirect_to reviews_path
    end
  end

private
  def review_params
    params.require(:review).permit(:content, :episode_id, :rating)
  end
end
