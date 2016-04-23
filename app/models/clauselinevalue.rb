class Clauselinevalue < ActiveRecord::Base
#associations
  belongs_to :clauseline
  belongs_to :linevalue
end