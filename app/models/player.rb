class Player < ActiveRecord::Base
  has_many :standings
  before_save :clean_twitter

  def twitter_url
    "http://twitter.com/#{twitter}"
  end

  private

  # Strip leading @ sign if the user included it
  def clean_twitter
    return unless twitter
    self.twitter = self.twitter.sub(/^@/, '')
  end
end
