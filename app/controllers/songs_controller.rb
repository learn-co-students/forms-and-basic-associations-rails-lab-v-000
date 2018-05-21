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
    # binding.pry
    # params => "song"=> {"title"=>"It's a Beautiful Day", "artist_name"=>"Big Bird", "genre_id"=>"108", "note_contents"=>["asdfsadf", "asdfasdf", "dfgsdfghdhs"]}
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
    params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
  end
end


# params:

# "song"=>
#   {"title"=>"Lollipops",
#    "artist_name"=>"50s Ladies",
#    "genre_id"=>"68",
#    "note_contents"=>["content 1", "content 2", "content 3"]},
#  "commit"=>"Create Song",
#  "controller"=>"songs",
#  "action"=>"create"}
