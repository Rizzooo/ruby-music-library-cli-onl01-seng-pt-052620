class Artist 
  attr_accessor :name, :song
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(artist)
    artist = Artist.new(artist) 
    artist.save
    artist
  end
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self 
    else
      nil 
    end
    
    if songs.include?(song)
      nil
    else
      @songs << song
    end
    @songs
  end
  
  def genres 
    @genre_array = []
    @songs.each do |song|
      if @genre_array.include?(song.genre)
        nil
      else 
        @genre_array << song.genre
      end
    end
    @genre_array
  end
  
  def songs
    @songs
  end
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
end