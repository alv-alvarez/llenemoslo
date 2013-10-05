class Event < ActiveRecord::Base
  resourcify

  belongs_to :category

  has_attached_file :imagen, styles: { medium: "200x200>", thumb: "48x48>" }
end
