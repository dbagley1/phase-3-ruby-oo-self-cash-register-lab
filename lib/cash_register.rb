class CashRegister
  attr_accessor :total, :discount, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @items << { title: title, price: price, quantity: quantity }
    @last_transaction = price * quantity
  end

  def apply_discount
    if @discount > 0
      @total = @total - (@total * 0.01 * @discount)
      "After the discount, the total comes to $#{sprintf("%d", @total)}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

  def items(arg1=0, arg2=0, arg3=0)
    result = []
    @items.each do |item|
      item[:quantity].times.each do
        result << item[:title]
      end
    end
    result
  end
end
