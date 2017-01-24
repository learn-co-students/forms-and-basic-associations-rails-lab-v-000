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


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end


  def create
    @song = Song.create({
      artist_name: params[:song][:artist_name],
      title: params[:song][:title]
      
      })

    #@song = Song.new(song_artist_name: params[:song_artist_name])
        #content: params[:post][:content]
      

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
    params.require(:song).permit(:title, :artist_name)
  end
end

