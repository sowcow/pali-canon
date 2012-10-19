class Page
  def route path=nil
    path ? path.gsub(' ','_') : super
  end
end

# actually route should pass what it likes to superclass
# and superclass use that value, adds index.html/extension  etc...

class Author < Page
  GOOD_ID = 'canon/*/author'

  INFO = %r|^/canon/(.*) by (.*)/author/$| 
  TITLE = [INFO, 1]
  AUTHOR = [INFO, 2]

  def author
    identifier[*AUTHOR]
  end

  def route
    super "/authors/#{author}/index.html"
  end
end