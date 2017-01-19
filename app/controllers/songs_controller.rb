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
    params.require(:song).permit(:artist_name, :title)
    # params.require(:song).permit(:artist, :title)
    #this line retrieves the "artist" string but the method artist_name isn't being called. Might need to call it on the next line but need to
    #ask how it can be called inside of the permit method
    # it probably won't be best practice to call the method directly after. It's probably something wrong with the naming of the text boxes
  end
end

