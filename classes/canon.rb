DROP_LAST = [%r|^(.*/)[^/]+/$|, 1]
LAST = [%r|^.*/([^/]+)/$|, 1]

class Page
  # it should be same for siblings! ...kind of parent.id ?
  #
  def relative_path id=identifier
    id[*DROP_LAST]
  end
  
  # relative_path && name ~ items are very same!
  #
  def name id=identifier
    id[*LAST]
  end  
end

class Canon < Page
  GOOD_ID = 'canon/**'
  PRIORITY = -1

  INFO = %r|^/canon/([^/]*) by ([^/]*)(/.*)$| 
  TITLE = [INFO, 1]
  AUTHOR = [INFO, 2]
  RELATIVE_PATH = [INFO, 3]

  def author
    identifier[*AUTHOR]
  end
  def title
    identifier[*TITLE]
  end
  def relative_path id=identifier
    id[*RELATIVE_PATH][*DROP_LAST]
  end

  attr_reader :siblings

  def store_siblings context
    @siblings = context.items.select { |those|
      (+those).is_a? Canon }.select { |those|
      (+those).title == title && (+those).relative_path == relative_path }.select { |those|
      (+those).author != author }
  end

  def fix_children ctx  # FIXME rename to `after_preprocessing` at nanoc-oo wrapper
    super
    store_siblings ctx
  end

  ROUTE = false
end