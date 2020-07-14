class Genre
  attr_accessor :name
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
   def save
    @@all << self
  end
  
  def self.create(genre)
    genre = Genre.new(name)
    genre.save
    genre
  end
  
  def artists=(artist)
    @artist = artist 
  end

  def artists
    @artist_array = []
    @songs.each do |song|
      if @artist_array.include?(song.artist)
        nil
      else 
        @artist_array << song.artist
      end
    end
    @artist_array
  end
  
  def add_song(song, genre = unknown)
    song = Song.new 
    @songs << song
    song.genre = self
  end
  
  def songs
    @songs
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
end