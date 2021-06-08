require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        quantity.times { self.items << item }
        self.last_transaction = price * quantity
        self.total += self.last_transaction
    end

    def apply_discount
        if self.discount
            self.total -= (self.total * (self.discount.to_f / 100.to_f)).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end
