class Page
  def relative_path id=identifier
    return id if id == '/'
    id[%r|^(.*/)[^/]+/$|, 1]
  end
end

class Canon < Page
  GOOD_ID = 'canon/**'
  PRIORITY = -1

  INFO = %r|^/canon/(.*) by (.*)/(.*)$| 
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
    id[*RELATIVE_PATH].sub(%r|(?<=./).+/|, '')
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