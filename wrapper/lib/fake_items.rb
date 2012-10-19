class FakeItems
  attr_reader :items
  
  def initialize where, params={nanoc:false}
    @params = params
    all = Dir["#{where}/**/*"]
    files = all.reject { |those| File.directory? those }.map { |item| create item }  # FakeItem.new item }
    dirs  = all.select { |those| File.directory? those }.map { |item| FakeDir.new item  }
    dirs.reject! { |dir| files.find { |file| file.identifier == dir.identifier } }
    @items = files + dirs
  end

  def create item
    fake = FakeItem.new item
    if @params[:nanoc] && defined? Nanoc
      content = fake.binary?? fake.file : File.read(fake.file)
      Nanoc::Item.new content, {}, fake.identifier
    else
      fake
    end
  end
end