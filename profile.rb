class Profile
  attr_reader :entries

  def initialize
    @entries = []
    File.open("sampleprofile", "r") do |io|  
      while line = io.gets
        if line.split.first == "export"
          @entries << Entry.new(line)
        end
      end
    end
  end
end