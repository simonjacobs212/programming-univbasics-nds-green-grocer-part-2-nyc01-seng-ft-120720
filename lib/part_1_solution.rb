require 'pry'

def find_item_by_name_in_collection(name, collection)
  collection.find do |product|
    product[:item] == name
  end
end


def consolidate_cart(cart)
  index = 0
  new_cart = []
  
  cart.each do |grocery_item|
    current_item = find_item_by_name_in_collection(grocery_item[:item], new_cart)
    if current_item
      new_cart_index = 0
      new_cart.each do |new_cart_item|
        if new_cart_item[:item] === current_item[:item]
          new_cart_item[:count] += 1
        end
        new_cart_index += 1
      end
    else
      grocery_item[:count] = 1
      new_cart << grocery_item
    end
    index += 1
  end
  new_cart
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