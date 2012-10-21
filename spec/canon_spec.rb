require 'support/all'


describe Canon do
  # subject { subject.new '' } # << crashes Ruby
  subject { Canon.new '' }

  explain_method :relative_path, <<-DOC
    /canon/en by Translator/             =>  `nil`
    /canon/en by Translator/one/         =>   /
    /canon/en by Translator/two/         =>   /
    /canon/en by Translator/some/other/  =>  /some/
    /canon/en by Translator/some/next/   =>  /some/
  DOC
end