class Guide < ActiveRecord::Base
#associations    
  has_many :items
  has_many :subclauses
  belongs_to :preamble
  belongs_to :postscript

#validations
  validates :text, presence: true

#scopes
#  scope :scope_name, ->(variables) {query}


#methods
def preamble_text
    preamble_id ? preamble.text : ""
end

def postscript_text
    postscript_id ? postscript.text : ""
end

def content
    preamble_text + text + postscript_text
end


end