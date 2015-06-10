class Item < ActiveRecord::Base
	validates :item, :presence => true
	validates :purchase_id, :presence => true, :uniqueness => true
	belongs_to :purchase
end
