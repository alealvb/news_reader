require_relative 'etc'

class Source
  attr_accessor :items, :dir, :name

  # @@data_loc = {
  #   data: ['data', 'feed'],
  #   title: ['content', 'title'],
  #   author: ['content', 'author'],
  #   link: ['content', 'url']
  # }

  # def data_loc
  #   @@data_loc
  # end

  def initialize
    @items = []
    #@dir = attributes[:dir]
    # @name = attributes[:name]
    #@data_loc = attributes[:dir]
  end
end
