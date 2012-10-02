class Rol < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name

  has_many :admin_rols
  has_many :admins, through: :admin_rols
end
