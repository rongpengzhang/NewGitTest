class BenchmarkFreqDistribution < ActiveRecord::Base    
  belongs_to :benchmarking
  
  validates :energyIQFrequency, :presence=> true, :numericality=> {:greater_than_or_equal_to=>0, :less_than_or_equal_to=>100}     
  validates :energyIQValue, :presence=> true,:numericality=> {:greater_than_or_equal_to=>0} 
end
