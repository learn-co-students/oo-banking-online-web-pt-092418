class Transfer
  attr_accessor :sender, :transfer, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @transfer = transfer
    @status = "pending"
    @receiver = receiver
    @amount = amount
  end

  def valid? 
    sender.status == "open" && receiver.status == "open"
  end

  def execute_transaction
    
  end

  def reverse_transfer
  end


end
