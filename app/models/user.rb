class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :conversations, :foreign_key => :sender_id

  serialize :friend_list, Array
  serialize :friend_pending, Array

  validates :username, presence: true, length: {maximum:20}
end
