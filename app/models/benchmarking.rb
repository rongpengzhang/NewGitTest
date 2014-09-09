require 'cbes'
class Benchmarking < ActiveRecord::Base
    belongs_to :building
    
    has_one :basic_information
    has_one :energy_usage
    has_many :benchmark_freq_distributions
     
    validates :officeWeeklyOperationHours,:numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
    validates :officeNumberOfComputers,:numericality=> {:only_integer=> true,:greater_than_or_equal_to=>0}, :allow_nil => true
    validates :officeNumberOfWorkers,:numericality=> {:only_integer=> true,:greater_than_or_equal_to=>0}, :allow_nil => true
    validates :retailWeeklyOperationHours,:numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
    validates :retailNumberOfComputers,:numericality=> {:only_integer=> true,:greater_than_or_equal_to=>0}, :allow_nil => true
    validates :retailNumberOfWorkers,:numericality=> {:only_integer=> true,:greater_than_or_equal_to=>0}, :allow_nil => true
end
