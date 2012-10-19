class FakeDir
  attr_reader :file
  attr_accessor :identifier  

  def initialize file
    @file = file
    @values = {}  
    @identifier = get_identifier      
  end    

  def +@
    @values[:object]
  end 
  def []= key, value
    @values[key] = value
  end
  def [] key
    @values[key]
  end 

  private
  def get_identifier
    dir = @file.sub(/.+?\//, '/')
    dir << '/' if dir[-1] != '/'
    dir
  end     
end