class RetrofitResult < ActiveRecord::Base
  belongs_to :preliminary_retrofit
  belongs_to :detailed_retrofit
end
