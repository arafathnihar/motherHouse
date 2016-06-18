class Order < ActiveRecord::Base

  validates :agentId, presence: true
  validates :receivingAgentId, presence: true
  validates :receiverId, presence: true
  validates :orderAmount, presence: true
  validates :orderCurrId, presence: true
  validates :supplyCurrId, presence: true
  validates :exchangeRate, presence: true
  validates :date, presence: true

end

