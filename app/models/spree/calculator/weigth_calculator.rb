require 'open3'

class Spree::Calculator::WeigthCalculator < Spree::ShippingCalculator
  preference :url, :string
  attr_reader :package

  def self.description
    I18n.t("calculator_name")
  end

  def compute_package(package)
    @package = package
    json = JSON.parse Open3.capture3("curl", "-X", "GET", "#{preferred_url}/#{zip}?#{params}").first
    Spree::LocalizedNumber.parse(json["cost"])
  end

  private

  def params
    "volume=#{volume}&weight=#{weight}&dimension=#{dimension}&amount=#{amount}"
  end

  def zip
    package.order.ship_address.zipcode
  end

  def weight
    package.weight.to_f
  end

  def volume
    package.volume.to_f
  end

  def dimension
    package.dimension.to_f
  end

  def amount
    package.order.item_total.to_f
  end
end


