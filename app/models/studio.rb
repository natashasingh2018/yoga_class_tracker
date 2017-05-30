class Studio < ApplicationRecord

  has_many :classsessions, :dependent => :destroy
  validates :name, :presence => true
validates :location, :presence => true
validates :location, :uniqueness => { :scope => [:name] }

end
