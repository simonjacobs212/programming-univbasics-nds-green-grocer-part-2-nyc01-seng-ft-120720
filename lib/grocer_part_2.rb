require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  cart.each_with_object([]) do |product, final_cart|
    apply_coupon = coupons.each do |coupon|
      if product[:item] == coupon[:item] && product[:count] >= coupon[:num]
        product[:count] = product[:count] - coupon[:num]
        final_cart << product
        discounted_product = {item: "#{product[:item]} W/COUPON", price: coupon[:cost] / coupon[:num], clearance: true, count: coupon[:num]}
        final_cart << discounted_product
      end
    end
    item_found = final_cart.find { |final_product| final_product[:item] == product[:item] }
    if !item_found
      final_cart << product
    end
    apply_coupon
  end
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
