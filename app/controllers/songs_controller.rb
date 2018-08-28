require 'pry'
class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    artist = Artist.find_or_create_by(name: params[:song][:artist_name])

    @song = Song.create(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    # any params with empty arrays must go last! :3
    # be careful with strong params failures ... be warned the console by passes strong params
    params.require(:song).permit(:artist_name, :title, :genre_id, :note_contents => [])
  end
end
