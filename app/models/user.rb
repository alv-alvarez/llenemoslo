class User < ActiveRecord::Base
  rolify
  
  has_many :ticket
  before_create :default_role

  def default_role
    self.add_role :user
  end
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
