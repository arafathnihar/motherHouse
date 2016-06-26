class Country < ActiveRecord::Base

  has_one :main_agent
  has_one :receiving_agent
  has_one :agent
  has_one :receiver

end
