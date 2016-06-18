class Agent < ActiveRecord::Base

  validates :mainAgentId, presence: true
  validates :name, presence: true

end
