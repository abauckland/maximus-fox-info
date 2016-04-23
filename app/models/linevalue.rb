class Linevalue < ActiveRecord::Base
#associations
  belongs_to :standarditem
  has_many :clauselinevalues
  has_many :clauselines, :through => :clauselinevalues
end