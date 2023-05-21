class Author < ApplicationRecord
  has_many  :books
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, comparison: {greater_than: 0}, numericality: { only_integer: true }
end
