class Subclause < ActiveRecord::Base
#associations    
  belongs_to :guide
  belongs_to :clausetype
  has_many :itemsubclauses
  has_many :items, :through => :itemsubclauses

#validations
  validates :title,
    presence: true,
    uniqueness: {:scope => [:title, :descript1, :descript2], message: ": A clause with same similar attributes already exists" }

  validates :clausetype_id,
    presence: true

#scopes
#  scope :scope_name, ->(variables) {query}

#methods
  def title_titleized
    title.titleize
  end

  def clausetype_title
    clausetype.text.titleize
  end

  def guidance
    guide.content
  end

end
