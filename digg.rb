require_relative 'etc'

module Digg
  DIR = "http://digg.com/api/news/popular"

  def self.get_items
    Etc.parse_json("#{DIR}")['data']['feed']
  end

  def self.create(item)
    _item = {}
    content = {}
    _item[:title] = item['content']['title']
    _item[:user] = 'digg'
    _item[:itemid] = item['story_id']
    content[:category] = 'popular'
    content[:link] = item['content']['url']
    time = Time.at(item['date'])
    content[:time] = time.strftime("%H:%M:%S")
    content[:date] = time.strftime("%d-%m-%Y")
    content[:author] = item['content']['author']
    _item[:content] = content
    _item
  end
end
