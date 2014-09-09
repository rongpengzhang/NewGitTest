class FlatUtilityRate < ActiveRecord::Base
  belongs_to :building
  belongs_to :preliminary_retrofit
  belongs_to :detailed_retrofit  
  
  validates :electricityUsageCharge, :presence=> true, :numericality=> {:greater_than_or_equal_to=>0} 
  validates :naturalGasUsageCharge, :presence=> true, :numericality=> {:greater_than_or_equal_to=>0} 
  validates :electricityDemandCharge, :presence=> true, :numericality=> {:greater_than_or_equal_to=>0} 
  
end
