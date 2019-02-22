# require 'pry'


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

  # binding.pry

  def create
    # binding.pry
    # byebug

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
# binding.pry
  def song_params
    # binding.pry
    params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
  end



end

# if its a url like google.com/search when you press enter, that sends a get request to that
#   route, /search back to google servers. those serbers then receive the request and finds the route
#   in their codebase. the route correseponds to a controller, which you hit, and which has access to the params.
#
