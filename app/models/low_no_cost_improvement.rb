class LowNoCostImprovement < ActiveRecord::Base
    belongs_to :building
    
    has_one :basic_information
    has_one :smart_meter
end
