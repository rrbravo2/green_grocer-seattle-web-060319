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
 total = {}
 cart.each do |food, info|
   coupons.each do |coupon|
     if food == coupon[:item] && info[:count] >= coupon[:num]
       info[:count] = info[:count] - coupon[:num]
       if total["#{food} W/COUPON"]
         result["#{food} W/COUPON"][:count] += 1
       else
         total["#{food} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
       end
     end
   end
   total[food] = info
  end
  total
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
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  total = 0
  cart.each do |name, price_hash|
    total += (price_hash[:price] * price_hash[:count]).to_f
  end
  total > 100 ? total * 0.9 : total# code here
end
