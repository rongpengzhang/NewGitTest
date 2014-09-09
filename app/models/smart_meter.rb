class SmartMeter < ActiveRecord::Base
  belongs_to :building
  belongs_to :low_no_cost_improvement

end
