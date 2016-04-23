class Perform < ActiveRecord::Base
#associations    
  has_many :characs
  has_many :instances, :through => :characs

  belongs_to :performkey
  belongs_to :performvalue


#scopes
  scope :item_performs, ->(item_id) {joins(:instances => :product).where('products.item_id' => item_id)}

#methods
  def perform_key
    performkey.text
  end

  def perform_value
    performvalue.text
  end

end
