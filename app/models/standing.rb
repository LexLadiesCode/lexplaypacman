class Standing < ActiveRecord::Base
  belongs_to :location
  belongs_to :player
end
