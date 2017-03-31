require_relative 'reddit'
require_relative 'mashable'
require_relative 'digg'

#  Reddit.get_items.each { |item| API.create(Reddit.create(item), :reddit) }

# API.all.each_with_index do |item, index|
#   puts "Number: #{index + 1}"
#   puts item[1].title
#   puts item[1].content[:author]
#   puts item[1].content[:time]
#   puts item[1].content[:date]
#   puts item[1].content[:category]
#   puts '###############'
# end

# items = Mashable.get_items
# items.each { |item| API.create(Mashable.create(item))}

class Main

  def initialize
    @page = 1
    @digg = Digg.new
  end

  def load_news
    @digg.create_items
  end

  def show_news
    @digg.items.each_with_index do |item, index|
      puts "Number: #{index + 1}"
      puts item.title
      puts item.author
      puts item.time
      puts item.date
      puts item.link
      puts '###############'
    end
  end

  def init
    load_news
    done = false
    while !done
      show_news
      if Etc.get_keypressed == 'a'
        done = true
      end
    end
  end
end

main = Main.new
main.init


