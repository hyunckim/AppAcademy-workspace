class AlbumsController < ApplicationController
  def show
    @album = @album.find_by(id: params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)

    else
      flash.now[:errors] = @album.errors.full_messages
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
    def album_params
      params.require(:album).permit(:album_name, :band_id, :form)
    end
end
