class TracksController < ApplicationController
  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url

    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def track_params
      params.require(:track).permit(:track_name, :album_id, :form)
    end
end
