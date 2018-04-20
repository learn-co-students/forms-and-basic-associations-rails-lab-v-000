class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  
  def index
    @artists = Artist.all
  end
  
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if !!@artist.save then redirect_to @artist
    else render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if !!@artist.update(artist_params) then redirect_to @artist
    else render :edit
    end
  end

  def destroy
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
  
  def set_artist
    @artist = Artist.find(params[:id])
  end
end
