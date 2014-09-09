class Building < ActiveRecord::Base
    has_one :basic_information
    has_one :energy_usage
    has_one :smart_meter
    has_one :flat_utility_rate
    has_one :emission
    has_one :investment
    has_one :benchmarking
    has_one :low_no_cost_improvement
    has_one :preliminary_retrofit
    has_one :detailed_retrofit
end
