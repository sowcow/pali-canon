Given 'I have an empty site' do
  open_new_empty_site
end

Given 'I have a site' do
  open_new_empty_site
  copy_wrapper_contents_here
  copy_data_dir_here
  copy_classes
end


def nanoc command
  step "I successfully run `ruby -S nanoc #{command}`"
end

def copy_wrapper_contents_here
  copy_all from: 'wrapper/.', to: current_dir
end

def copy_data_dir_here
  copy_all from: 'content', to: current_dir
end

def copy_classes
  copy_all from: 'classes/.', to: File.join(current_dir, 'lib/classes')
end

def open_new_empty_site
  nanoc 'create-site site'
  step 'I cd to "site"'
  rm_r File.join(current_dir, 'content')
end






__END__
Step '[>$] ?nanoc *' do |command|
  step "I successfully run `ruby -S nanoc #{command}`"
end


When 'I successfully compile it' do
  step '$ nanoc compile'
  step 'it is successfully compiled'
end

Then 'it is successfully compiled' do
  step 'a directory named "output" should exist'
  step 'the file "crash.log" should not exist'
end


When 'I copy the nanoc-oo wrapper here' do
  copy_all from: 'wrapper/.', to: current_dir
end

Given 'I have a wrapped default nanoc site' do
  step 'I have a default nanoc site'
  step 'I copy the nanoc-oo wrapper here'
end

Given 'I have a blank wrapped nanoc site' do
  step 'I have a wrapped default nanoc site'
  step 'I remove the file "content/index.html"'
  step 'I remove the file "content/stylesheet.css"'
end