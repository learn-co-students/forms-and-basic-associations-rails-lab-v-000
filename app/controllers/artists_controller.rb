class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def show
    find_artist
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    show_or_rerender(:new)
  end

  def edit
    find_artist
  end

  def update
    find_artist
    @artist.update(artist_params)
    show_or_rerender(:edit)
  end

  def destroy
    find_artist
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def show_or_rerender(page)
    if @artist.valid?
      redirect_to artist_path(@artist)
    else
      render page
    end
  end
end
