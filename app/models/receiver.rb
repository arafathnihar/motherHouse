class Receiver < ActiveRecord::Base
  belongs_to :country

  has_one :order

  validates :name, presence: { message: "receiver name is required" }
  validates_numericality_of :contact, :allow_blank => true, :message => "phone number format is invalid"
  validates_length_of :contact, :minimum => 10, :maximum => 15,  :allow_blank => true,  :message => "phone number lenght should be within 10-15 digits (inclusive)"
  validates_numericality_of :bankAcNo, :allow_blank => true, :message => "account number format is invalid"

end
