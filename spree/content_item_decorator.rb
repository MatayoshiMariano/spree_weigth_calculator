Spree::Stock::ContentItem.class_eval do
  def dimension
    variant.dimension * quantity
  end
end
