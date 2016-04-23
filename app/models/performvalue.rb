class Performvalue < ActiveRecord::Base
#associations  
  has_many :performs

#scopes
  scope :item_performvalues_array, ->(item_id, key_id) {
                                        joins(:performs => [:performkey, :instances => :product]
                                      ).where('products.item_id' => item_id, 'performkeys.id' => key_id
                                      ).pluck(:text
                                      ).uniq
                                      }
end