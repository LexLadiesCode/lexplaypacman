class Standing < ActiveRecord::Base
  belongs_to :location
  belongs_to :player

  scope :with_locations, ->{ joins('LEFT OUTER JOIN locations ' +
                                   'ON locations.id=standings.location_id') }
end
