require_relative 'etc'

class Source
  attr_accessor :items, :dir, :name

  def initialize
    @items = []
  end
end
