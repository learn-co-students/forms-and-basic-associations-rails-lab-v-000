class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    #remember that song_ is a prefix automatically associated with the song model
    #kind of like _path with the routes
    #If we want to let the user pick from existing categories, we can use a Collection Select helper to render a <select> tag:
    #http://jebediahelliott.com/what_the_heck_is_collection_select
  end

  def create
    @song = Song.create(song_params)
    #https://github.com/learn-co-curriculum/forms-and-basic-associations-rails-lab/issues/16
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
    params.require(:song).permit(:title, :artist_name, :genre_id, :note_contents => [])
    #you need to permit what you need.
  end
end

