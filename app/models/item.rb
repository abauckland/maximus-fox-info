class Item < ActiveRecord::Base
#associations    
  belongs_to :guide
  belongs_to :verion
  has_many :products
  has_many :itemsubclauses
  has_many :subclauses, :through => :itemsubclauses
  
  has_many :itemrelates
  has_many :itemitems

#validations
  validates :title,
    presence: true,
    uniqueness: {:scope => :title, message: ": An item with the same title already exists" }

#scopes
#  scope :scope_name, ->(variables) {query}

  scope :title_search, ->(search_term) {where('title LIKE ?', "%#{search_term.to_s}%")}


#!  scope :order_by_ref_system, ->(client, ref_system) {joins('client_name', :)}
#!  scope :order_by_ref_system, ->(ref_system) {joins(:ref_system)}

#!  scope :order_by_parent, ->() {}

#  scope :all_associated_items, ->(variables) {query}
#  scope :associated_child_items, ->(variables) {query}
#  scope :associated_parent_items, ->(variables) {query}
#  scope :all_item_subclauses, ->(variables) {query}
#  scope :guide, ->(variables) {query}

#  scope :all_products, ->(variables) {query}

#  scope :associated_references, ->(variables) {query}

#  scope :ref_system_references, ->(variables) {query}


#methods
  def title_titleized
    title.titleize
  end

  def child_ids
    self.child_items.pluck(:child_id)
  end

  def parent_ids
    self.parent_items.pluck(:parent_id)
  end

  def subclause_ids
    subclauses.ids
  end

  def product_ids
    products.ids
  end

  def guidance
    guide.content
  end

end