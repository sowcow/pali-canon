require 'support/all'


describe Page do
  subject { Page.new '' }

  explain_method :relative_path, %W[
    /                /
    /some/           /
    /some/other/     /some/
    some/other/      some/
    some/other/one/  some/other/
    some/other/one   `nil`
  ]
end