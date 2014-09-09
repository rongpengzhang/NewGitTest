class DetailedRetrofit < ActiveRecord::Base 
    belongs_to :building  
    
    has_one :basic_information
    has_one :energy_usage
    has_one :flat_utility_rate
    has_one :emission
    has_one :investment
    has_one :simulation_result # The baseline result
    has_many :retrofit_results # The suggested measures
end
