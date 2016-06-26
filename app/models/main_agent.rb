class MainAgent < ActiveRecord::Base
  has_many :agent

  validates :customId, presence: { message: "main agent id is required" }
  validates :name, presence: { message: "name is required" }
  validates_numericality_of :contact, :allow_blank => true, :message => "phone number format is invalid"
  validates_length_of :contact, :minimum => 10, :maximum => 15,  :allow_blank => true,  :message => "phone number lenght should be within 10-15 digits (inclusive)"

end
