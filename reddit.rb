require_relative 'etc'

module Reddit
  DIR = "https://www.reddit.com"

  def self.get_items
    Etc.parse_json("#{DIR}/")['data']['children']
  end

  def self.create(item)
    data = item['data']
    _item = {}
    content = {}
    _item[:title] = data['title']
    _item[:user] = 'reddit'
    _item[:itemid] = data['id']
    content[:category] = data['subreddit']
    content[:link] = DIR + data['permalink']
    time = Time.at(data['created'])
    content[:time] = time.strftime("%H:%M:%S")
    content[:date] = time.strftime("%d-%m-%Y")
    content[:author] = data['author']
    _item[:content] = content
    _item
  end


end
