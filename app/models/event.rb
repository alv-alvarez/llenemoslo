class Event < ActiveRecord::Base
  resourcify

  belongs_to :category
  has_many :tickets

  has_attached_file :imagen, styles: { index: "270x145#", medium: "200x200>", thumb: "48x48>" }
end
