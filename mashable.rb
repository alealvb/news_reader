require_relative 'etc'
require_relative 'source'
require_relative 'item'

class Mashable < Source

  def initialize
    super
    @dir = 'http://mashable.com/stories'
  end

  def get_items
    items = []
    json = Etc.parse_json(@dir)
    json['new'].each { |item| items << item }
    json['rising'].each { |item| items << item }
    json['hot'].each { |item| items << item }
    items
  end

  def create_items
    item = {}
    get_items.each do |data|
      item[:title] = data['title']
      item[:itemid] = data['_id']
      item[:link] = data['link']
      time = data['post_date'].split('T')[1].split('+')[0]
      item[:time] = time
      date = Date.parse(data['post_date'])
      item[:date] = date.strftime("%d-%m-%Y")
      item[:author] = data['author']
      @items.push(Item.new(item))
    end
    @items
  end
end
