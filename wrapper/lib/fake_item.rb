class FakeItem
  attr_reader :file
  attr_accessor :identifier
    
  def initialize file
    @file = file
    @identifier = get_identifier
    @values = {}
  end

  def binary?
    require 'ptools'
    File.binary?(file)
  end

  def raw_content
    File.read file
  end
  
  def +@
    @values[:object]
  end 
  def []= key, value
    @values[key] = value
  end
  def [] key
    return extension if key == :extension
    @values[key]
  end  
    
  private
  def get_identifier
    (@file.sub(/.+?\//, '/').sub(/\.[^\/]+/, '') + '/').sub(%r[/index/$], '/')
  end
  
  def extension
    @file[/\.([^\/]+)$/, 1].to_s
  end  
end