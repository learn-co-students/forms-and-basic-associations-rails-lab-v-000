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

  def edit
    @song = Song.find(params[:id])
  end

  def create
    p song_params
    song = Song.create(song_params)
    redirect_to controller: 'songs', action: 'index'
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
  end
end