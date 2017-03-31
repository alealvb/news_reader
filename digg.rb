require_relative 'etc'
require_relative 'source'
require_relative 'item'

class Digg < Source

  def initialize
    super
    @dir = "http://digg.com/api/news/popular"
  end

  def create_items
    get_items_loc.each do |attr|
      item = {}
      item[:title] = attr['content']['title']
      item[:user] = 'digg'
      item[:itemid] = attr['story_id']
      item[:category] = 'popular'
      item[:link] = attr['content']['url']
      time = Time.at(attr['date'])
      item[:time] = time.strftime("%H:%M:%S")
      item[:date] = time.strftime("%d-%m-%Y")
      item[:author] = attr['content']['author']
      @items.push(Item.new(item))
    end
    @items
  end

  def get_items_loc
    Etc.parse_json("#{@dir}")['data']['feed']
  end
end
