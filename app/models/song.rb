class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
     self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
    notes.each do |note|
      if note != nil && note != ""
        new_note = Note.find_or_create_by(content: note)
        self.notes << new_note
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
        note.content
    end
  end

  def note_ids=(ids)
    ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end

end

# rspec spec/models/song_spec.rb
# rspec spec/features/song_form_spec.rb
