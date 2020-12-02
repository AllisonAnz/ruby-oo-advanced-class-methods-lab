class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #Song.create
  #Build a class constructor that initializes
  #a song and saves it to @@all
  def Song.create
    song = Song.new
    song.save
    song
  end

  #song = Song.create
  #p Song.all #=> [#<Song:0x00007fffdb628198>], returns the song instnce that was initialized and saved

  #Song.new_by_name
  #Build a class constructor
  #that takes in the string name of a song
  #and returns a song instance with that name set as its name property
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  #song = Song.new_by_name("The middle")
  # p song.name

  #Song.create_by_name
  #Build a class constructor
  #that takes in the string of a song name
  #and returns a song instance with that set as its name property
  #and the song being saved into the @@all class varaible
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  #song = Song.create_by_name("The Middle")
  #p song

  #Song.find_by_name
  #build a class finder that
  #accepts the string name of a song
  #returns that matching instance of the song with that name
  def self.find_by_name(song_name)
    @@all.detect{|s| s.name == song_name}
  end
  # the_middle = Song.create_by_name("The Middle")
  # p Song.find_by_name("The Middle")

  #Song.find_or_create_by_name
  #In order to prevent duplicate songs being created that actually represent the same sone
  #build a class method that accepts
  #a string name for a song and either
  #return a matching song instance with that name or
  #create a new song with their name and return the song instance
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  #Song.alphabetical
  #returns all songs in ascending alphabetical order
  def self.alphabetical
    @@all.sort_by{|s| s.name}
  end

  #Song.new_from_filename
  #build a class constructor that
  #accepts a file name in the format
  # "<Artist Name> - <Song Name>.mp3"`
  # "Taylor Swift - Blank Space.mp3".
  def Song.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  #Song.create_from_filename
  #Build a class constructor that 
  #accepts a filename in the format
  #<Artist Name> - <Song Name>.mp3"
  #"Taylor Swift - Blank Space.mp3"
  #this class method should not only parse the filename
  #but should save the sone instance that was created
  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end


  #Song.destroy_all
  #reset the state of @@all class to an empty array
  def Song.destroy_all
    @@all.clear
  end

end




