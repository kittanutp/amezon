class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :title,
  message: "Title must be unique" }
  validates :author_id, presence: true

   belongs_to :author
end
