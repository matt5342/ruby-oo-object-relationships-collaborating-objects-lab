class MP3Importer


    def initialize(path)
        @path = path
    end
    def path
        @path
    end

    def files
        file_names = []
        Dir.foreach(@path) do |file|
            if file.end_with?("mp3")
                file_names.push(file)
            end
        end
        file_names
        # => ["Real Estate - It's Real - hip-hop.mp3",
        #     "Real Estate - Green Aisles - country.mp3",
        #     "Thundercat - For Love I Come - dance.mp3",
        #     "Action Bronson - Larry Csonka - indie.mp3"]
    end

    def import
        file_names = self.files
        file_names.each do |file|
            Song.new_by_filename(file)
        end
    end

end
