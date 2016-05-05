class Version < ActiveRecord::Base
#associations
  has_many :items
end