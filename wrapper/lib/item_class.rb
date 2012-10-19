class Class
  def subclasses
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end

class ItemClass
  attr_reader :classes
  
  def initialize
    @classes = find_classes
  end
  
  def [] item
    @classes.find { |that| that.accept? item.identifier }
  end
  
  private
  def find_classes
    Page.subclasses.sort_by { |x| x::PRIORITY }.reverse
  end
end