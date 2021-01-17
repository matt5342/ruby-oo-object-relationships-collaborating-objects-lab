require 'pry'
class Artist
    @@all = []
    attr_accessor :name
    def initialize(name)
        @name = name
        save
    end
    def save
        @@all.push(self)
    end
    def songs
        Song.all.select {|song| song.artist == self}
    end
    def add_song(song)
        @@all.push(song)
        song.artist = self
    end
    def self.find_or_create_by_name(name)
            Artist.all.each do |element| 
                if element.name == name
                    return element
                end
            end
            Artist.new(name)
    end

    def self.all
        @@all
    end
    def print_songs
        Song.all.each do |element| 
            if element.artist == self
                puts element.name
            end
        end
    end

end
