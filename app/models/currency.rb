class Currency < ActiveRecord::Base
    has_one :receiving_agent
end
