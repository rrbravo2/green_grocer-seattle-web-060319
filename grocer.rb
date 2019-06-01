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
 coupons.each do |coupon|
   coupon_name = coupon[:item]
   coupon_item_number = coupon[:number]
   cart_item = cart[coupon_name]
   next if cart_item.nil? || cart_item[:count] < coupon_item_number
   cart_item[:count] -= coupon_item_number
   coupon_in_cart = cart["#{coupon_name} W/COUPON"]
   if coupon_in_cart
     coupon_in_cart[:count] += 1
      else cart["#{coupon_name} W/COUPON"] = {price: coupon[:cost], clearance: cart_item[:clearance], count: 1}
     end
   end
  cart
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
