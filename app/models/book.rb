class Book < ActiveRecord::Base
  attr_accessible :description, :isbn, :title, :authors, :publisher
  validates :title, :isbn, :description, presence: true
  validates :isbn, numericality: { :only_integer => true} 
  validates :isbn, length: { is: 13 }
  validates_uniqueness_of :title
  belongs_to :publisher
  has_many :author_books
  has_many :authors, through: :author_books

  def authors=(authors_input)
    self.authors << authors_input.split(', ').collect do |name|
      Author.where(name: name).first || Author.create(name: name)
    end
  end

  def publisher=(name)
    _publisher = Publisher.where(name: name).first || Publisher.create(name: name)
    self.publisher_id = _publisher.id
  end
end
