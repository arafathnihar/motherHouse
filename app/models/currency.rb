class Currency < ActiveRecord::Base

  has_one :order, :class_name => "Order"

end
