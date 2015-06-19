Spree::Variant.class_eval do
  def dimension
    (width || 0) + (height || 0) + (depth || 0)
  end
end
