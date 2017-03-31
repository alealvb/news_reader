class Item
  attr_accessor :title, :link, :date, :source, :time, :author

  def initialize(attributes)
    @title = attributes[:title]
    @link = attributes[:link]
    @date = attributes[:date]
    @time = attributes[:time]
    @source = attributes[:source]
    @author = attributes[:author]
  end

  def self.get(id)
    @@posts[id]
  end
end
