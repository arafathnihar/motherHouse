module GuidHelper
  def before_create()
    # self.guid = UUID.timestamp_create().to_s
    self.guid = SecureRandom.uuid
  end
end