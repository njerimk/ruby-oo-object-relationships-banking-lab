require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status
  attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender != nil && self.receiver != nil
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
      # if self.status == "complete"
      #   return
      # #self.valid = true
      # elsif self.valid? == false || self.sender.balance < self.amount
      #   self.status = "rejected" 
      #   "Transaction rejected. Please check your account balance."
      # elsif self.valid?
      #   self.receiver.balance += self.amount
      #   self.sender.balance -= self.amount
      #   self.status = "complete"
      # else
      # end
    if self.valid? && self.status == "pending" && self.sender.balance >= self.amount
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      self.status = "complete"
    else
      self.status = "rejected" 
      "Transaction rejected. Please check your account balance."
    end

      # binding.pry
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end