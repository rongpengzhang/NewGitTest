class PreliminaryRetrofit < ActiveRecord::Base
    belongs_to :building
    
    has_one :basic_information
    has_one :energy_usage
    has_one :flat_utility_rate
    has_one :emission
    has_one :investment    
    has_one :baseline_result, :class_name => "SimulationResult", :foreign_key => :preliminary_retrofit_id
    has_many :suggested_retrofit_results, :class_name => "RetrofitResult", :foreign_key => :suggested_retrofit_id
    has_many :unsuggested_single_retrofit_results, :class_name => "RetrofitResult", :foreign_key => :unsuggested_single_retrofit_id
        
    validates :lightUpgradeID, :presence=> true
    validates :windowUpgradeID, :presence=> true
    validates :coolingUpgradeID, :presence=> true
    validates :heatingUpgradeID, :presence=> true  
end
