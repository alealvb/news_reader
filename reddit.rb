require_relative 'etc'
require_relative 'source'

class Reddit < Source

  def initialize
    super
    @dir = 'https://www.reddit.com'
  end

  def get_items
    Etc.parse_json("#{@dir}/")['data']['children']
  end

  def create_items
    a = get_items
    a.each do |item|
      data = item['data']
      _item = {}
      _item[:title] = data['title']
      _item[:itemid] = data['id']
      _item[:link] = @dir + data['permalink']
      time = Time.at(data['created'])
      _item[:time] = time.strftime("%H:%M:%S")
      _item[:date] = time.strftime("%d-%m-%Y")
      _item[:author] = data['author']
      @items.push(Item.new(_item))
    end
    @items
  end


end
