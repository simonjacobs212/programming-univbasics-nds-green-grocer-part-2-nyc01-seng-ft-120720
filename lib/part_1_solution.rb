require 'pry'

def find_item_by_name_in_collection(name, collection)
  collection.find do |product|
    product[:item] == name
  end
end

def consolidate_cart(cart)
  cart.each_with_object([]) do |product, final_cart|
    new_item = find_item_by_name_in_collection(product[:item], final_cart)
    if !new_item
      product[:count] = 1
      final_cart << product
    else
      new_item[:count] += 1
    end
  end
end
