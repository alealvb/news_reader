require_relative 'item'
module API
  def self.create(resource, attributes)
    case resource
    when :post
      Item.create(attributes)
    else
      "#{resource} not available"
    end
  end

  def self.show(resource, id)
    case resource
    when :post
      Item.show(id)
    else
      "#{resource} not available"
    end
  end

  def self.all
    Item.all
  end
end
