class Itemrelate < ActiveRecord::Base
#associations 
  belongs_to :item
  has_many :itemitems

#enum
  enum relation: [:parent, :child]

end