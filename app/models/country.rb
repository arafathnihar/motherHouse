class Country < ActiveRecord::Base

  has_one :receiving_agent
  has_one :agent

end
