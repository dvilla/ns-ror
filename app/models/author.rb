class Author < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true
  has_many :author_books
  has_many :books, through: :author_books
end
