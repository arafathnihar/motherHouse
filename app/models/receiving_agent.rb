class ReceivingAgent < ActiveRecord::Base

  #belongs_to :country

  validates :customId, presence: { message: "receiving agent id is required" }
  validates :main_agent_id, presence: { message: "main agent id is required" }
  validates :name, presence: { message: "name is required" }
  validates_numericality_of :contact, :allow_blank => true, :message => "phone number format is invalid"
  validates_length_of :contact, :minimum => 10, :maximum => 15,  :allow_blank => true,  :message => "phone number lenght should be within 10-15 digits (inclusive)"

end
