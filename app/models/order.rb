class Order < ActiveRecord::Base

  validates :agentId, presence: { message: "agent id is required" }
  validates :receivingAgentId, presence: { message: "receiving agent id is required" }
  validates :receiverId, presence: { message: "receiver id is required" }
  validates :orderCurrId, presence: { message: "order currency is required" }
  validates :supplyCurrId, presence: { message: "exchange currency is required" }

  validates_presence_of :orderAmount, :message => "order amount is required"
  validates_numericality_of :orderAmount, :allow_nil => true, :greater_than => 0, :message => "order amount should be a number and greater than zero"

  validates_presence_of :exchangeRate, :message => "exchange rate is required"
  validates_numericality_of :exchangeRate, :allow_nil => true, :greater_than => 0, :message => "exchange rate should be a number and greater than zero"

  validates_presence_of :orderDate, :message => "order date is required"

end

