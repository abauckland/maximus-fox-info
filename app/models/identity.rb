class Identity < ActiveRecord::Base
  #associations  
  has_many :productidentities
  has_many :products, :through => :productidentities

  has_many :speclines
  has_many :alteravtions

  belongs_to :identvalue
  belongs_to :identkey
end
