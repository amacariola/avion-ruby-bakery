require 'bigdecimal'

require_relative 'recursion_breakdown'
require_relative 'product'

module Bakery

  PRODUCTS = {
    'VS5' => {
      3 => '6.99',
      5 => '8.99'
    },
    'MB11' => {
      2 => '9.95',
      5 => '16.95',
      8 => '24.95'
    },
    'CF' => {
      3 => '5.95',
      5 => '9.95',
      9 => '16.99'
    }
  }

  class << self
    def products
      @@products ||= {}
    end

    def product( code )
      code  = code.upcase
      packs = PRODUCTS[ code ]
      if packs
        products[ code ] ||= Product.new(
          packs.each_with_object( {} ) { |(k, v), memo| memo[ k ] = BigDecimal( v ) }
        )
      end
    end

    def cost_and_breakdown( code, amount )
      prod = product( code )
      prod.cost_and_breakdown( amount ) if prod
    end
  end

end
