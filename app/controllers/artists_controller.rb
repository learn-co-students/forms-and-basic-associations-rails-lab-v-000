class ArtistsController < ApplicationController
  before_action :select_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def show

  end

  def new
    @artist = Artist.new
  end

  def create
    raise params.inspect 
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit

  end

  def update
    @artist.update(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :edit
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

  def select_artitst
    @artist = Artist.find(params[:id])
  end
end
