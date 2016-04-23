class Clauseline < ActiveRecord::Base
#associations
  belongs_to :txt
  belongs_to :linetype
  belongs_to :subclause
  has_many :clauselinevalues
  has_many :linevalues, :through => :clauselinevalues
end