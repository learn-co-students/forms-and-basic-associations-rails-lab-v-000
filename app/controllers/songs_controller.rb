class SongsController < ApplicationController
  before_action :set_song, only: [:destroy, :show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
    @genres = Genre.all
  end

  def create
    song = Song.new(song_params)

    if song.save
      redirect_to song
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    flash[:notice] = "Song deleted."
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

