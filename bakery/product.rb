module Bakery
  class Product
    attr_reader :packs, :pack_keys

    def initialize( packs, b_klass = Backtracking )
      @packs  = packs
      @pack_keys  = b_klass.new( packs.keys )
    end

    # Returns pack breakdown with connected prices per pack
    def cost_and_breakdown( amount )
      if amount > 0
        breakdown = pack_keys.pack_breakdown( amount )
        if breakdown
          breakdown.each_with_object( {} ) do |( pack, count ), result|
            result[ pack ] = {
              count: count,
              price: packs[ pack ]
            } if count > 0
          end
        end
      end
    end

  end
end
