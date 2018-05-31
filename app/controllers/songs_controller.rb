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
    # NOTE : Was having trouble figuring out how to use the "note_contents" along with the specifically named input fields
    # puts "Create Params = #{params}"
    params[:song][:note_contents] = []
    # puts "params song = #{params[:song]} || params song notes = #{params[:song_notes_1]}"
    params[:song][:note_contents] << params[:song_notes_1]
    params["song"]["note_contents"] << params["song_notes_2"]
    # puts "Note Params = #{note_params}"
    # params[:song][:note_contents] << note_params

    # puts "Updated params : #{params}"
    @song = Song.new(song_params)
    # puts "Song Params = #{song_params}"
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
    params.require(:song).permit(:title, :genre_id, :artist_name, note_contents: [])
  end

  def note_params
    params.permit(:song_notes_1, :song_notes_2)
  end

end
