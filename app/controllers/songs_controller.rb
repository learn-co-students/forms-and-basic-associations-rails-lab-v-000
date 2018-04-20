class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  
  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new
  end

  def create
    params[:song][:genre_name] = Genre.find(params[:song][:genre_id]).name
    @song = Song.new(song_params)
    if !!@song.save then redirect_to @song
    else render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if !!@song.update(song_params) then redirect_to @song
    else render :edit
    end
  end

  def destroy
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre_name, :note_contents => [])
  end
  
  def set_song
    @song = Song.find(params[:id])
  end
end

