class Agent < ActiveRecord::Base
  belongs_to :main_agent
  belongs_to :country

  has_many :order
  has_many :mother_account
  has_many :agent_accounts

  validates :customId, presence: { message: "agent id is required" }
  validates_uniqueness_of :customId, :allow_nil => true, :message => "agent id is already exits"

  validates :name, presence: { message: "name is required" }

  validates_numericality_of :contact, :allow_blank => true, :message => "phone number format is invalid"
  validates_length_of :contact, :minimum => 10, :maximum => 15,  :allow_blank => true,  :message => "phone number lenght should be within 10-15 digits (inclusive)"
end
