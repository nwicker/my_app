class Item < ActiveRecord::Base
	validates :item, :presence => true
	validates :purchase_id, :presence => true
	belongs_to :purchase
	
end

def purchases
	return Purchase.find_by(:id => location)

end