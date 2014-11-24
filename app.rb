require 'shoes'

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

class Entry 
  attr_reader :key, :value

  def initialize(line)
    @key, @value = parse_entry(line)
  end

  def display_formatted
    puts "export #{key}=#{value}"
  end

  def parse_entry(line)
    line_split = line.split
    key = line_split[1].split("=").first
    value = line_split[1].split("=").last

    return key, value
  end
end

profile = Profile.new

Shoes.app width: 552, height: 350 do
  background white
  stack(margin: 8) do 
    banner "GHOUL"
  end
  stack(margin: 8) do
    profile.entries.each do |entry|
      row = flow do 
        edit_line entry.key
        edit_line entry.value
        button "save"
        del = button "delete"
        del.click() do 
          row.clear
        end
      end
    end
  end
end