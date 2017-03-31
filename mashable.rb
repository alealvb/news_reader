require_relative 'etc'

module Mashable
  DIR = 'http://mashable.com/stories'

  def self.get_items
    items = []
    Etc.parse_json(DIR)['new'].each { |item| items << item }
    Etc.parse_json(DIR)['rising'].each { |item| items << item }
    Etc.parse_json(DIR)['hot'].each { |item| items << item }
    items
  end

  def self.create(data)
    item = {}
    content = {}
    item[:title] = data['title']
    item[:user] = 'mashable'
    item[:itemid] = data['_id']
    content[:category] = data['channel']
    content[:link] = DIR + data['link']
    time = data['post_date'].split('T')[1].split('+')[0]
    content[:time] = time
    date = Date.parse(data['post_date'])
    content[:date] = date.strftime("%d-%m-%Y")
    content[:author] = data['author']
    item[:content] = content
    item
  end
end
