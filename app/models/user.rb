class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
		
		has_many :purchases
		has_many :items, :through => :purchases , :source => :items
          validates :email, :presence => true, :uniqueness => true
end
