config = Rails.application.config
config.spree.calculators.shipping_methods << Spree::Calculator::WeigthCalculator
