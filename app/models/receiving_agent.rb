class ReceivingAgent < ActiveRecord::Base

  belongs_to :country

  validates :mainAgentId, presence: true
  validates :name, presence: true

end
