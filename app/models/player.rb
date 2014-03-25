class Player < ActiveRecord::Base
  has_many :standings
  before_save :clean_twitter
  validates :email, uniqueness: true, allow_blank: true
  validate :email_has_at_sign
  validate :has_some_data

  def twitter_url
    "http://twitter.com/#{twitter}"
  end

  private

  # Strip leading @ sign if the user included it
  def clean_twitter
    return unless twitter
    self.twitter = self.twitter.sub(/^@/, '')
  end

  def email_has_at_sign
    return unless email.present?
    unless email =~ /@/
      errors.add(:email, 'does not include @')
    end
  end

  def has_some_data
    if email.blank? && twitter.blank?
      errors.add(:base, 'Either Twitter or email address must be given')
    end
  end
end
