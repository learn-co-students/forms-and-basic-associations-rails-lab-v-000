class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many   :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name.titlecase : nil
  end

  def note_contents=(notes)
    notes.each do |n|
      if !n.empty?
        note = Note.create(content: n, song_id: self.id)
        self.notes << note
      end
    end
  end

  def song_notes
    self.notes
  end

end
