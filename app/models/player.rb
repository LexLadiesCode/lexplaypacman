class Player < ActiveRecord::Base
	has_many :standing
  before_save :clean_twitter
  accepts_nested_attributes_for :standing

  private

  # Strip leading @ sign if the user included it
  def clean_twitter
    return unless twitter
    self.twitter = self.twitter.sub(/^@/, '')
  end
end
