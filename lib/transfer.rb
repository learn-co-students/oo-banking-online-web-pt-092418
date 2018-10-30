require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @status = "pending"
    @receiver = receiver
    @amount = amount
  end

  def valid? 
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == "complete"
      @status
    elsif !@sender.valid? || @sender.balance < @amount
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    else
      @sender.deposit(-1 * @amount)
      @receiver.deposit( @amount)
      @status = "complete"   
    end
  end

  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      @sender.deposit(@amount)
      @receiver.deposit(-1 * @amount)
    end
  end


end
