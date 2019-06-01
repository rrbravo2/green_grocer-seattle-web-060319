def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |data|
    data.each do |item, details|
      if consolidated_cart.keys.include?(item)
        consolidated_cart[item][:count] += 1
   else
     consolidated_cart[item] = details
     consolidated_cart[item][:count] = 1
      end
    end
  end
  consolidated_cart
end


def apply_coupons(cart, coupons)


end

def apply_clearance(cart)
  cart.each do |item, price_hash|
    if price_hash[:clearance] == true
      price_hash[:price] = (price_hash[:price] * 0.8).round(2)
    end# code here
   end
  cart
end

def checkout(cart, coupons)
  # code here
end
