require 'json'
require 'rest-client'

module Etc

  def self.get_keypressed
    system('stty raw -echo')
    t = STDIN.getc
    system('stty -raw echo')
    return t
  end

  def self.parse_json(dir)
    JSON.parse(RestClient.get(dir + '.json'))
  end
end
