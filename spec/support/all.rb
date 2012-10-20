module This
  extend self
  
  def file
    File.expand_path __FILE__
  end
  
  def dir
    File.split(file)[0]
  end    
end

def ruby_files_at dir
  Dir["#{dir}/*.rb"].to_a
end

def require_here dir=This.dir
  Dir.chdir dir do
    Dir['*.rb'].each { |file| require File.expand_path file }
  end
  #ruby_files_at(dir).each { |file| require File.expand_path file } # require_relative file }
end


require_here