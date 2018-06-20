class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  
  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    @song.save ? (redirect_to @song) : (render :new)
  end

  def edit
  end

  def update
    @song.update(song_params)

    @song.save ? (redirect_to @song) : (render :edit)
  end

  def destroy
    @song.destroy and flash[:notice] = "Song deleted."
    
    redirect_to songs_path
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end
    
  def song_params
    params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
  end
end

