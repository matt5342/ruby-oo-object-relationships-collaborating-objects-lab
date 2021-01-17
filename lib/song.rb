class Song
    @@all = []
    attr_accessor :name, :artist, :genre
    def initialize(name)
        @name = name
        save
    end
    def save
        @@all.push(self)
    end
    def self.all
        @@all
    end
    def self.new_by_filename(file)
            artist = file.split(" - ")[0]
            song = file.split(" - ")[1]
            genre = file.split(" - ")[2].delete_suffix('.mp3')
            art = Artist.find_or_create_by_name(artist)
            from_file = Song.new(song)
            from_file.artist = art
            from_file.genre = genre
            @@all.push(from_file)
            from_file
    end

    def artist_name=(artist_name) #accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
        # binding.pry
        # self.artist = artist_name
        self.artist = Artist.find_or_create_by_name(artist_name)

        # binding.pry
        # self.artist = art.name
      
    end


end
