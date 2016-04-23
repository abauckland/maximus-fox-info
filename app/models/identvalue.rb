class Identvalue < ActiveRecord::Base
#associations
  has_many :identities

#scopes
  scope :item_identvalues_array, ->(item_id, key_id) {joins(:identities => [:identkey, :products]
                                      ).where('products.item_id' => item_id, 'identkeys.id' => key_id
                                      ).pluck(:text
                                      ).uniq
                                      }
end