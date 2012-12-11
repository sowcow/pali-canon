#require 'pali-canon'
require 'aruba/cucumber'
include FileUtils


def clean_temp
  rm_rf 'tmp'
end
AfterConfiguration do |config|
  clean_temp
end
at_exit do
  #clean_temp
end


Before do
  @aruba_timeout_seconds = 60
end