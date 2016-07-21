class MotherAccount < ActiveRecord::Base
  belongs_to :main_agent
  belongs_to :agent
  belongs_to :currency

  has_one :agent_account
end
