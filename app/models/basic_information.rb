class BasicInformation < ActiveRecord::Base
  belongs_to :building
  belongs_to :benchmarking
  belongs_to :low_no_cost_improvement
  belongs_to :preliminary_retrofit
  belongs_to :detailed_retrofit
  
  validates :buildingTypeID, :presence=> true
  validates :yearBuilt, :presence=> true,:numericality=> { :only_integer=> true,:greater_than_or_equal_to=>1500, :less_than_or_equal_to=>2013}
  validates :zipcode, :presence=> true,:numericality=> { :only_integer=> true,:greater_than_or_equal_to=>90001, :less_than_or_equal_to=>96162}
  validates :grossFloorArea, :presence=> true,:numericality=> { :greater_than_or_equal_to=>0, :less_than_or_equal_to=>1000000}
  validates :retailFloorAreaPercentage,:presence=> true, :numericality=> { :greater_than_or_equal_to=>0, :less_than_or_equal_to=>100}
end
