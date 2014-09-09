class EnergyUsage < ActiveRecord::Base
  belongs_to :building
  belongs_to :benchmarking
  belongs_to :preliminary_retrofit
  belongs_to :detailed_retrofit
  
  validates :electricityUsageMonthly_1, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :electricityUsageMonthly_2, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :electricityUsageMonthly_3, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :electricityUsageMonthly_4, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :electricityUsageMonthly_5, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :electricityUsageMonthly_6, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :electricityUsageMonthly_7, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :electricityUsageMonthly_8, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :electricityUsageMonthly_9, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :electricityUsageMonthly_10,:numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :electricityUsageMonthly_11,:numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :electricityUsageMonthly_12,:numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  
  validates :naturalGasUsageMonthly_1, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :naturalGasUsageMonthly_2, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :naturalGasUsageMonthly_3, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :naturalGasUsageMonthly_4, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :naturalGasUsageMonthly_5, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :naturalGasUsageMonthly_6, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :naturalGasUsageMonthly_7, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :naturalGasUsageMonthly_8, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :naturalGasUsageMonthly_9, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :naturalGasUsageMonthly_10, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :naturalGasUsageMonthly_11, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :naturalGasUsageMonthly_12, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true 
  
  validates :meter1stBillMonth, :presence=> true,:numericality=> {:only_integer=> true,:greater_than_or_equal_to=>1, :less_than_or_equal_to=>12}
  validates :meter1stBillYear, :presence=> true,:numericality=> {:only_integer=> true,:greater_than_or_equal_to=>2011}
end
