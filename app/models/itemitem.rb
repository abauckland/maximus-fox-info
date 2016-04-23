class Itemitem < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Item'
  belongs_to :child, :class_name => 'Item'
end