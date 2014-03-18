class Standing < ActiveRecord::Base
  belongs_to :location
  belongs_to :player

  scope :with_locations, ->{ joins('LEFT OUTER JOIN locations ' +
                                   'ON locations.id=standings.location_id') }

  def rank
    # Add 1 because the index method returns a 0-based ranking.
    Standing.order('score DESC').pluck(:id).index(id) + 1
  end
end
