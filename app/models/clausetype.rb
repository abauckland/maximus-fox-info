class Clausetype < ActiveRecord::Base
#associations
  has_many :subclauses
end
