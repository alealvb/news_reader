require 'json'
require 'rest-client'

module Etc

  DIR = {
    reddit: 'https://www.reddit.com/',
    mashable: 'http://mashable.com/stories',
    digg: 'http://digg.com/api/news/popular'
  }

  def get_dir(type_of)
    dir = DIR[:type_of]
  end

  def self.parse_json(dir)
    JSON.parse(RestClient.get(dir + '.json'))
  end
end
