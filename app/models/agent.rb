class Agent < ActiveRecord::Base

  validates :mainAgentId, presence: { message: "main agent id is required" }
  validates :name, presence: { message: "name is required" }

end
