class MainAgent < ActiveRecord::Base

  validates :name, presence: { message: "name is required" }

end
