class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)

    # #try

# Invokes the method identified by the symbol method, passing it any arguments and/or the block specified, just like the regular Ruby Object#send does.

# Unlike that method however, a NoMethodError exception will not be raised and nil will be returned instead, if the receiving object is a nil object or NilClass.

# If try is called without a method to call, it will yield any given block with the object.

  # without #try
  # @person && @person.name
  # or
  # @person ? @person.name : nil

  # with #try
  # @person.try(:name)
  
    # if !self.artist.nil?
    #   self.artist.name
    # end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    # learn solution
    self.try(:genre).try(:name)

    # if !self.genre.nil?
    #   self.genre.name
    # end
  end

  def note_contents=(contents)
    contents.each do |content|
      if content.strip != ""
        self.notes.build(content: content)
        self.save
      end
    end
  end

  def note_contents
    # solution on learn
    self.notes.map(&:content)

    # if !self.notes.nil?
    #   self.notes.map do |note|
    #     note.content
    #   end
    # end
  end
end

