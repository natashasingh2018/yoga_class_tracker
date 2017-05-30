class Classsession < ApplicationRecord

  belongs_to :format
  belongs_to :studio
  belongs_to :user

  validates :participants, :numericality => { :greater_than_or_equal_to => 0 }

  validates :participants, :presence => true

  validates :length, :numericality => { :greater_than => 0 }

  validates :length, :presence => true

end
