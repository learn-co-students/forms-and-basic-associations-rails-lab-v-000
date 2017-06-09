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
    @song = Song.new(song_params)

    # it's simpler to use Rails conventions of passing params
    # and writing a setter method in the Song model
    # for setting a note
    #
    # if notes_1 = params[:song][:song_notes_1][0]
    #   @song.notes.build content: notes_1
    # end
    #
    # if notes_2 = params[:song][:song_notes_2][0]
    #   @song.notes.build content: notes_2
    # end

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end


  private

  def song_params
    params.require(:song).permit(:artist_name, :title, :genre_id, note_contents: [])
  end

end
