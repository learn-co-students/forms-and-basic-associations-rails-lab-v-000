class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    @genres = Genre.all
    @names = []
    @genres.each do |genre|
      @names << genre.name
    end
    @names
  end

  def create
    @song = Song.new(song_params)
    if !notes.empty?
      @song.note_contents=(notes)
    end
    if @song.save
      redirect_to song_path(@song)
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
      redirect_to song_path(@song)
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

  def notes
    @notes = []
    params[:song][:note_contents].each do |note|
      if note != ""
        @notes << note
      end
    end
    @notes
  end

  def song_params
    params.require(:song).permit(:title, :genre_name, :artist_name)
  end

end
