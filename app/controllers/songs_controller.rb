class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
    find_song
  end

  def new
    @song = Song.new

    @song.notes.build(content: 'Note 1')
    @song.notes.build(content: 'Note 2')
  end

  def create
    @song = Song.create(song_params)

    show_or_redirect(:new)
  end

  def edit
    find_song
  end

  def update
    find_song
    @song.update(song_params)

    show_or_redirect(:edit)
  end

  def destroy
    find_song
    @song.destroy

    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
  end

  def find_song
    @song = Song.find(params[:id])
  end

  def show_or_redirect(page)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render page
    end
  end
end
