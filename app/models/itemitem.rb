class Itemitem < ActiveRecord::Base
  belongs_to :item
  belongs_to :itemrelate
end