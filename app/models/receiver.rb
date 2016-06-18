class Receiver < ActiveRecord::Base

  validates :name, presence: true
  validates :created_by, presence: true

end
