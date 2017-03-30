class Item
  attr_accessor :title, :user, :content, :itemid
  # uno: {title: "title", user: 'not jon doe', content: {link:'google.xD', date: 'date',...}}
  @@posts = {}

  def initialize(attributes)
    @title = attributes[:title]
    @content = attributes[:content]
    @user = attributes[:user]
    @itemid = attributes[:itemid]
  end

  def self.all
    @@posts
  end

  def self.create(attributes)
    itemid = attributes[:itemid]
    post = Item.new(attributes)
    @@posts[itemid] = post
  end

  def self.show(id)
    @@posts[id]
  end
end
