class Productkeyword < ActiveRecord::Base
#associations  
  belongs_to :keyword
  belongs_to :product

end