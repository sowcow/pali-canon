require 'support/all'


describe Page do
  subject { Page.new '' }

  explain_method :relative_path, %W[
    /                 `nil`
    /some/            /
    /some/other/      /some/
    /some/other/      /some/
    /some/other/one/  /some/other/
    /some/other/two/  /some/other/
  ]

  explain_method :name, %W[
    /                 `nil`
    /some/            some
    /some/other/      other
    /some/other/one/  one
    /some/other/two/  two
  ]  
end