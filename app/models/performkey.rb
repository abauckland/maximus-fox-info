class Performkey < ActiveRecord::Base
#associations    
  has_many :performs
  belongs_to :unit
  belongs_to :standard

#scopes
  scope :item_performkey, ->(item_id) {joins(:performs => [:instances => :product]
                                      ).where('products.item_id' => item_id
                                      ).uniq}

end