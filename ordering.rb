

require_relative 'bakery/bakery'

def print_cost_and_breakdown( cost_breakdown )
  sum = cost_breakdown.values.reduce( 0 ) do |memo, pack|
    memo + pack[ :count ] * pack[ :price ]
  end.to_f

  puts "Total: $#{ sum }"
  cost_breakdown.each do |pack_size, pack|
    puts " Order  #{ pack[ :count ] } x #{ pack_size } $#{ pack[ :price ].to_f }"
  end
end

# Main work cycle

$stdin.each_line do |line|
  amount, code = line.split
  print " QTY: #{ amount } PRODUCT CODE: #{ code } "
  cost_breakdown = Bakery.cost_and_breakdown( code, amount.to_i )
  if cost_breakdown
    print_cost_and_breakdown( cost_breakdown )
  else
    puts 'no solution'
  end
end
