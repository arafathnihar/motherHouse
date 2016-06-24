class ReceivingAgent < ActiveRecord::Base

  belongs_to :country

  validates :mainAgentId, presence: { message: "main agent id is required" }
  validates :name, presence: { message: "name is required" }

end
