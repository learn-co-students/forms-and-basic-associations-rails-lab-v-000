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
    @song = Song.new(song_params)
    @song.artist_name = artist_param[:artist_name]
    @song.genre_id = genre_param[:genre_id]
    note_params.each do |param|
    Note.create(content: param, song: @song)
    end
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
    params.require(:song).permit(:title)
  end
  
    def artist_param
    params.require(:song).permit(:artist_name)
  end

   def genre_param
    params.require(:song).permit(:genre_id)
  end

   def note_params
    params.require(:song).permit(notes:[])[:notes]
  end
end

