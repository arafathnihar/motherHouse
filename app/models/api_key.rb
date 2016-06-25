class ApiKey < ActiveRecord::Base
  before_create :generate_access_token

  # self.expires_at = DateTime.now + 2.minutes

  private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token) # check if same token exists
  end
end
