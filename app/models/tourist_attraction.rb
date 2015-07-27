class TouristAttraction < ActiveRecord::Base
  belongs_to :city
  has_many :reviews, dependent: :destroy
  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  def self.find_nearby_attractions (origin, rad)
    #this is where we do the calculations and return then array of nearby attractions
    TouristAttraction.within(rad, :origin => origin)
  end
end
