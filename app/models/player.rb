class Player < ActiveRecord::Base
  before_save :clean_twitter

  private

  # Strip leading @ sign if the user included it
  def clean_twitter
    return unless twitter
    self.twitter = self.twitter.sub(/^@/, '')
  end
end
