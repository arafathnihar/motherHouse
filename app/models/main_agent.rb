class MainAgent < ActiveRecord::Base
  belongs_to :country

  has_many :agent
  has_many :receiving_agent
  has_many :mother_accounts

  validates :customId, presence: { message: "main agent id is required" }
  validates_uniqueness_of :customId, :allow_nil => true, :message => "main agent id is already exits"

  validates :name, presence: { message: "name is required" }

  validates_numericality_of :contact, :allow_blank => true, :message => "phone number format is invalid"
  validates_length_of :contact, :minimum => 5, :maximum => 15,  :allow_blank => true,  :message => "phone number lenght should be within 5-15 digits (inclusive)"
end
