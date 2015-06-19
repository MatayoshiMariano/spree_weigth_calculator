Spree::Stock::Package.class_eval do
  def dimension
    contents.sum(&:dimension)
  end
end
