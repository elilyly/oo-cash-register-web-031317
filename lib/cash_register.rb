require 'pry'
class CashRegister

  attr_accessor :total, :discount, :last_transaction
  attr_reader :last_price, :final_items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @cart = []
  end

  def cart
    @cart = []
  end

  def items
    @items
  end

  def add_item(food, price, quantity = 1)
    cart << food
    for i in 1..quantity
        @items << food
    end

    if quantity > 0
      self.total += quantity * price
    else
      self.total += price
    end
    @last_price = price
  end

  def apply_discount
    if  self.discount != 0
       self.total -=  self.total * (self.discount * 0.01)
       "After the discount, the total comes to $#{self.total.round}."
    else
       "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_price
  end
end