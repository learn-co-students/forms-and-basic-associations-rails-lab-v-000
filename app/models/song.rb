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
    # self.artist.name if self.artist
    # self.try(:artist).try(:name)
    
    # ternary_operator
    # if_this_is_a_true_value ? then_the_result_is_this : else_it_is_this
     self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    # self.notes.map(&:content)
    # &: is the shorthanded way of writing a block like below.
    self.notes.map {|note| note.content}
  end

end
