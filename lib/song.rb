class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = new
    song.save
    song
  end

  def self.new_by_name(name)
    song = new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    existing_song = find_by_name(name)
    song = if existing_song.nil?
             create_by_name(name)
           else
             existing_song
           end
    song
  end

  def self.alphabetical
    all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song_array = filename.scan(/^([\w ]+)+ - ([\w ]+)\.mp3$/i).flatten
    song = new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    song_array = filename.scan(/^([\w ]+)+ - ([\w ]+)\.mp3$/i).flatten
    song = new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
