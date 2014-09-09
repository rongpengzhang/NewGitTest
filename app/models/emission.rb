class Emission < ActiveRecord::Base  
  belongs_to :building
  belongs_to :preliminary_retrofit
  belongs_to :detailed_retrofit  
  
  validates :electricityEmissionRate, :presence=> true, :numericality=> {:greater_than_or_equal_to=>0} 
  validates :naturalGasEmissionRate, :presence=> true, :numericality=> {:greater_than_or_equal_to=>0} 
end
