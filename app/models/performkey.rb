class Performkey < ActiveRecord::Base
#associations    
  has_many :performs

#scopes
  scope :item_performkey_ids, ->(item_id) {joins(:performs => [:instances => :product]
                                      ).where('products.item_id' => item_id
                                      ).ids.uniq}

end