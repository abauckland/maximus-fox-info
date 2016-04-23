class Product < ActiveRecord::Base
#associations  
  has_many :clauseproducts
  has_many :productidentities
  has_many :identities, :through => :productidentities
  has_many :instances
  belongs_to :item
end
