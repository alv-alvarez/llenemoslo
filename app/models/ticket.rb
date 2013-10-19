class Ticket < ActiveRecord::Base
  resourcify
  
  belongs_to :user
  belongs_to :event

end
