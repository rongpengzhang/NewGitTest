class Investment < ActiveRecord::Base
  belongs_to :building
  belongs_to :preliminary_retrofit
  belongs_to :detailed_retrofit
  
  validates :maxBudget, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true
  validates :maxPaybackYear, :numericality=> {:greater_than_or_equal_to=>0}, :allow_nil => true 
  validates :priorityID, :presence=> true
end
