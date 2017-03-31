require 'json'
require 'rest-client'

module Etc

  DIR = {
    reddit: 'https://www.reddit.com/',
    mashable: 'http://mashable.com/stories',
    digg: 'http://digg.com/api/news/popular'
  }

  def self.get_keypressed
    system('stty raw -echo')
    t = STDIN.getc
    system('stty -raw echo')
    return t
  end

  def self.get_dir(type_of)
    DIR[type_of]
  end

  def self.parse_json(dir)
    JSON.parse(RestClient.get(dir + '.json'))
  end
end
