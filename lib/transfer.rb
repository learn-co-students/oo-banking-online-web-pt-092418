class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :bad_transfer, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @bad_transfer = bad_transfer
    @status= "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending" #checks if the transfer is possible
      @sender.balance -= @amount #removes amount from sender's balance
      @receiver.balance += @amount #adds amount to recipient's balance
      @status= "complete"
    else
      @status= "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status= "reversed"
    end
  end

end
