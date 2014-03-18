class Location < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :standings

  def description
  	"#{name} - #{street_address}, #{city} #{state} #{postal_code}"
  end
end
