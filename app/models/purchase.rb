class Purchase < ActiveRecord::Base
	has_many :items
	belongs_to :profile , :class_name => "User", :foreign_key => "profile_id"
	validates :amount, :presence => true
	validates :location, :presence => true
	validates :account_balance_change, :presence => true

end
