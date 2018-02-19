class ShortUrl < ApplicationRecord
  has_many :activities, :dependent => :destroy

  before_create :assign_short_id

  def self.get_short_id(full_url)
    return Digest::MD5.hexdigest(full_url + "SALTSALTSALT").slice(0..6)
  end

  private
  def assign_short_id
    self.short_id = ShortUrl.get_short_id(self.full_url)
  end
end
