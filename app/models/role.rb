class Role < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name

  has_many :admin_roles
  has_many :admins, through: :admin_roles
end
