class Format < ApplicationRecord

  has_many :classsessions, :dependent => :destroy

  validates :title, :presence => true
validates :description, :presence => true

end
