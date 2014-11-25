class Entry
  attr_accessor :key, :value

  def initialize(line = 'export a=b')
    @key, @value = parse_entry(line)
  end

  def display_formatted
    puts "export #{key}=#{value}"
  end

  def formatted
    "export #{key}=#{value}"
  end

  def save_changes(key, value)
    @key = key
    @value = value
  end

  def parse_entry(line)
    line.slice! 'export '
    key = line.split('=').first
    value = line.split('=').last

    return key, value
  end
end
