require_relative 'api'
require_relative 'reddit'
require_relative 'mashable'
require_relative 'digg'

#  Reddit.get_items.each { |item| API.create(:post, Reddit.create(item)) }

# API.all.each_with_index do |item, index|
#   puts "Number: #{index + 1}"
#   puts item[1].title
#   puts item[1].content[:author]
#   puts item[1].content[:time]
#   puts item[1].content[:date]
#   puts item[1].content[:category]
#   puts '###############'
# end

items = Mashable.get_items
items.each { |item| API.create(:post, Mashable.create(item))}

items = Digg.get_items
items.each { |item| API.create(:post, Digg.create(item)) }

API.all.each_with_index do |item, index|
  puts "Number: #{index + 1}"
  puts item[1].title
  puts item[1].content[:author]
  puts item[1].content[:time]
  puts item[1].content[:date]
  puts item[1].content[:category]
  puts item[1].content[:link]
  puts '###############'
end
