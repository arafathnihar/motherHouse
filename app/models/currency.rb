class Currency < ActiveRecord::Base

  has_one :order, :class_name => "Order"
  has_many :mother_account
  has_many :agent_account

end
