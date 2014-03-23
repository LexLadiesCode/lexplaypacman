class Standing < ActiveRecord::Base
  belongs_to :location
  belongs_to :player

  validates_presence_of :initials
  validates_length_of :initials, :maximum=>3, :message=>" are limited to 3 characters!"
  validates_exclusion_of :initials, :in => %w( ass cok coq dik fag fuc fuk fuq tit ), :message => "cannot be rude words"
  validates_presence_of :score
  validates_numericality_of :score, :less_than_or_equal_to=>3333360

  scope :with_locations, ->{ joins('LEFT OUTER JOIN locations ' +
                                   'ON locations.id=standings.location_id') }

  def rank
    # Add 1 because the index method returns a 0-based ranking.
    Standing.order('score DESC').pluck(:id).index(id) + 1
  end
end
