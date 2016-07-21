class AgentAccount < ActiveRecord::Base
  belongs_to :mother_account, :class_name => 'MotherAccount', :foreign_key => 'mother_ac_id'
  belongs_to :agent
  belongs_to :currency
end
