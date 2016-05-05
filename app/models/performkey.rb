class Performkey < ActiveRecord::Base
#associations    
  has_many :performs

#scopes
  scope :item_performkey, ->(item_id) {joins(:performs => [:instances => :product]
                                      ).where('products.item_id' => item_id
                                      ).uniq}

end