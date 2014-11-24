class Entry 
  attr_reader :key, :value

  def initialize(line = "export a=b")
    @key, @value = parse_entry(line)
  end

  def set_key(key)
    @key = key 
  end

  def set_value(value)
    @value = value
  end

  def display_formatted
    puts "export #{key}=#{value}"
  end

  def formatted
    return "export #{key}=#{value}"
  end

  def save_changes(key, value)
    @key = key 
    @value = value
  end

  def parse_entry(line)
    line.slice! "export "
    key = line.split("=").first
    value = line.split("=").last

    return key, value
  end
end