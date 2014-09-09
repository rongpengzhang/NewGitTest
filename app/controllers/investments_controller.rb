class InvestmentsController < ApplicationController
  def self.to_API_Model(obj)
      investment = CBES::Investment.new
      investment.maxBudget= obj.maxBudget
      investment.maxPaybackYear= obj.maxPaybackYear
      investment.priorityID = obj.priorityID
      return investment
  end  
end
