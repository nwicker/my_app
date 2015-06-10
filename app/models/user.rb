class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
		
		has_many :purchases
		has_many :items, :through => :purchases , :source => :items
         validates :first_name, :presence => true
         validates :last_name, :presence => true
         validates :email, :presence => true, :uniqueness => true
end
