class Itemsubclause < ActiveRecord::Base
#associations    
  belongs_to :item
  belongs_to :subclause
end