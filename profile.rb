class Profile
  attr_reader :entries

  def initialize
    @entries = []
    File.open(ENV['HOME']+'/.ghoul_profile', "r+") do |io| 
      while line = io.gets
        if line.split.first == "export"
          @entries << Entry.new(line)
        end
      end
    end
  end

  def write_profile
    File.open(ENV['HOME']+'/.ghoul_profile', "w") do |io|
      @entries.each do |e|
        io.puts e.formatted
      end
    end
    add_shim
  end

  private 
  def add_shim
    shim_found = false
    File.open(ENV['HOME']+'/.profile', "r") do |io|
      while line = io.gets 
        if line.include? "[[ -s \"$HOME/.ghoul_profile\" ]] && source \"$HOME/.ghoul_profile\""
          shim_found = true
        end
      end
    end

    if !shim_found
      puts 'shim not found!!'
      puts 'adding shim to ~/.profile'
      File.open(ENV['HOME']+'/.profile', "a") do |io|
        io << "\n"
        io << "# Added by Ghoul\n"
        io << "[[ -s \"$HOME/.ghoul_profile\" ]] && source \"$HOME/.ghoul_profile\""
      end

    end

  end

end