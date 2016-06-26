class Order < ActiveRecord::Base
  belongs_to :receiver
  belongs_to :agent
  belongs_to :receiving_agent
  belongs_to :currency

  validates :agent_id, presence: { message: "agent id is required" }
  validates :receiving_agent_id, presence: { message: "receiving agent id is required" }
  validates :receiver_id, presence: { message: "receiver id is required" }
  validates :order_curr_id, presence: { message: "order currency is required" }
  validates :supply_curr_id, presence: { message: "exchange currency is required" }

  validates_presence_of :orderAmount, :message => "order amount is required"
  validates_numericality_of :orderAmount, :allow_nil => true, :greater_than => 0, :message => "order amount should be a number and greater than zero"

  validates_presence_of :exchangeRate, :message => "exchange rate is required"
  validates_numericality_of :exchangeRate, :allow_nil => true, :greater_than => 0, :message => "exchange rate should be a number and greater than zero"

  validates_presence_of :orderDate, :message => "order date is required"

end

