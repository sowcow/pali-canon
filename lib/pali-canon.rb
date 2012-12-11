require "pali-canon/version"
require 'fileutils'

module PaliCanon
  def datadir
    Gem.datadir('pali-canon')
  end

  def content_dir
    join datadir, 'content'
  end

  def classes_dir
    join datadir, 'classes'
  end

  def prepare dir
    system "nanoc-oo #{dir} --blank"
    cp_r content_dir, dir
    cp_r classes_dir, join(dir,'lib')
  end

  def compile dir
    Dir.chdir dir do
      system 'nanoc compile'
      move_directory_conents_here_with_removing_all_files_and_dirs_found_nearby 'output', danger: true
    end
  end

  extend self
end

def move_directory_conents_here_with_removing_all_files_and_dirs_found_nearby dir, params
  raise 'Danger!' unless params[:danger] == true
  (Dir['*'] - [dir]).each do |source|
    File.directory?(source) ? rm_r(source) : File.delete(source)
  end
  cp_r "#{dir}/.", '.'
  rm_r dir unless Dir.exist? "#{dir}/#{dir}"
end


BEGIN{
  def join *a; File.join *a end
  include FileUtils
}