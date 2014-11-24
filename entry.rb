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