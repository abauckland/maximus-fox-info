class Product < ActiveRecord::Base
#associations  
  has_many :items
  has_many :instances
  has_many :productkeywords
  belongs_to :item
  belongs_to :type
  belongs_to :range

  accepts_nested_attributes_for :clauseproducts

end
