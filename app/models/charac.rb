class Charac < ActiveRecord::Base
#associations
  belongs_to :instance
  belongs_to :perform
end
