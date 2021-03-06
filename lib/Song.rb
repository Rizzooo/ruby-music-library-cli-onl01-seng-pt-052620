class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end
  
  def save
    @@all << self
  end
  
  def self.create(song)
    song = self.new(song) 
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def artist 
    @artist 
  end
  
  def genre=(genre) 
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def genre 
    @genre 
  end
  
  def self.find_by_name(name)
    @@all.detect do |song| 
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  
  def self.new_from_filename(file)
    separate = file.split(" - ")
    
    song_name = separate[1]
    artist_name = separate[0]
    genre_name = separate[2].split(".mp3").join
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
end