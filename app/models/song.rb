class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist=Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(id)
    self.genre=Genre.find(id)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def note_contents=(notes)
    notes.each do |note|
      if !note.empty?
        note=Note.find_or_create_by(content:note)
        self.notes<<note  #we have to do this here because we're making a custom setter?
        note.song_id=self.id
      end
    end
  end

  #def note_contents=(notes_array)
  #  notes_array.each do |note|
  #    n=Note.find_or_create_by(content:note)
  #  end
  #end


  def note_contents
    self.notes.collect {|note| note.content}
  end

  def genre_name=(name)
    gen=Genre.find_or_create_by(name:name)
    gen.songs<<self
    self.genre=gen
  end

  def genre_name
    self.genre.name
  end
end
