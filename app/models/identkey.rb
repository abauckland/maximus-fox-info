class Identkey < ActiveRecord::Base
  #associations
  has_many :identities

#scopes
  scope :item_identkey, ->(item_id) {joins(:identities => :products
                                      ).where('products.item_id' => item_id
                                      ).uniq}
end