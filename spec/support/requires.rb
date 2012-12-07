require 'nanoc-oo'
require 'rspec_explain'

Dir.chdir Gem.datadir('nanoc-oo') do
  require_here 'wrapper/lib/classes'
end

Dir.chdir Gem.datadir('pali-canon') do
  require_here 'classes'
end